import 'dart:async';
import 'package:chnan/Cubits/cubit%20Material/material_cubit.dart';
import 'package:chnan/Cubits/cubit%20Material/material_states.dart';
import 'package:chnan/Cubits/cubit%20stock/stock_cubit.dart';
import 'package:chnan/Cubits/cubit%20stock/stock_state.dart';
import 'package:chnan/models/medicine_model.dart';
import 'package:chnan/utils/custom_Floating_action_button.dart';
import 'package:chnan/views/new_material_view.dart';
import 'package:chnan/widgets/medicine_card.dart';
import 'package:chnan/widgets/text_field_barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialView extends StatefulWidget {
  const MaterialView({super.key});
  static String id = 'MaterialView';

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  final TextEditingController _barcodeController = TextEditingController();
  Timer? _debounce;

  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _barcodeController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _searchTerm = _barcodeController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _barcodeController.dispose();
    super.dispose();
  }

  List<MedicineModel> _filterMaterials(List<MedicineModel> materials) {
    if (_searchTerm.isEmpty) return materials;

    return materials.where((medicine) {
      final nameLower = medicine.name.toLowerCase();
      final barcodeLower = medicine.barcode.toLowerCase();
      return nameLower.contains(_searchTerm) ||
          barcodeLower.contains(_searchTerm);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              TextFieldBaracode(controller: _barcodeController),
              const SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: BlocBuilder<MaterialCubit, MaterialStates>(
                    builder: (context, materialState) {
                      if (materialState is MaterialSuccess) {
                        final filteredMaterials = _filterMaterials(
                          materialState.materials,
                        );

                        return BlocBuilder<StockCubit, StockState>(
                          builder: (context, stockState) {
                            if (stockState is StockLoaded) {
                              return ListView.builder(
                                padding: const EdgeInsets.only(bottom: 100),
                                itemCount: filteredMaterials.length,
                                itemBuilder: (context, index) {
                                  final medicine = filteredMaterials[index];
                                  final quantity =
                                      stockState.totalQuantities[medicine.id] ??
                                      0;
                                  return MedicineCard(
                                    medicineId: medicine.id!,
                                    name: medicine.name,
                                    count: quantity.toString(),
                                    internalCode: medicine.internalCode,
                                    barcode: medicine.barcode,
                                    unit: medicine.unit,
                                    onDelete: () async {
                                      await context
                                          .read<MaterialCubit>()
                                          .deleteMaterial(medicine.id!);
                               
                                    },
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        );
                      } else if (materialState is MaterialLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (materialState is MaterialFailure) {
                        return Center(
                          child: Text('خطأ: ${materialState.errorMessage}'),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 80,
          right: 16,
          child: CustomFloatingActionButton(
            hint: 'اضافة بطاقة مادة',
            onPressed: () {
              Navigator.pushNamed(context, NewMedicineView.id);
            },
          ),
        ),
      ],
    );
  }
}

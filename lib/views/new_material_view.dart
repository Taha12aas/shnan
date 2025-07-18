import 'dart:developer';

import 'package:chnan/Cubits/cubit%20Material/material_cubit.dart';
import 'package:chnan/Cubits/cubit%20Material/material_states.dart';
import 'package:chnan/models/medicine_model.dart';
import 'package:chnan/utils/const.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/widgets/custom_button_save.dart';
import 'package:chnan/widgets/custom_text_field.dart';
import 'package:chnan/widgets/text_field_barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewMedicineView extends StatefulWidget {
  const NewMedicineView({super.key});
  static String id = 'NewMedicineView';

  @override
  State<NewMedicineView> createState() => _NewMedicineViewState();
}

class _NewMedicineViewState extends State<NewMedicineView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final barcodeController = TextEditingController();
  final internalCodeController = TextEditingController();
  final unitController = TextEditingController();

  bool _isLoading = false; // متغير لتتبع حالة الانتظار

  @override
  void dispose() {
    nameController.dispose();
    barcodeController.dispose();
    internalCodeController.dispose();
    unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaterialCubit, MaterialStates>(
      listener: (context, state) {
        if (state is MaterialLoading) {
          setState(() {
            _isLoading = true;
          });
        } else {
          setState(() {
            _isLoading = false;
          });
        }

        if (state is MaterialSuccess) {
          Navigator.pop(context);
        } else if (state is MaterialFailure) {
          log(state.errorMessage);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('مادة جديدة', style: FontStyleApp.white18),
              backgroundColor: kAppColor,
            ),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    CustomTextField(
                      focusNode: FocusNode(),
                      hintText: 'اسم المادة',
                      controller: nameController,
                    ),
                    const SizedBox(height: 10),
                    TextFieldBaracode(controller: barcodeController),
                    const SizedBox(height: 10),
                    CustomTextField(
                      keyType: TextInputType.numberWithOptions(),
                      focusNode: FocusNode(),
                      hintText: 'كود المادة للمحاسب',
                      controller: internalCodeController,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      focusNode: FocusNode(),
                      hintText: 'الوحدة',
                      controller: unitController,
                    ),
                    const SizedBox(height: 20),
                    CustomButtonSave(
                      label: "اضافة",
                      onTap:
                          _isLoading
                              ? null
                              : () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  final medicine = MedicineModel(
                                    name: nameController.text,
                                    barcode: barcodeController.text,
                                    internalCode: internalCodeController.text,
                                    unit: unitController.text,
                                  );
                                  context.read<MaterialCubit>().addMaterial(
                                    medicine,
                                  );
                                }
                              },
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading)
            ModalBarrier(
              dismissible: false,
              color: Colors.black.withOpacity(0.5),
            ),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

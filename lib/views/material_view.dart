import 'package:chnan/utils/custom_Floating_action_button.dart';
import 'package:chnan/views/new_material_view.dart';
import 'package:chnan/widgets/medicine_card.dart';
import 'package:flutter/material.dart';

class MaterialView extends StatelessWidget {
  const MaterialView({super.key});
  static String id = 'MaterialView';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return MedicineCard(
                        internalCode: '10103',
                        name: 'مذيب  قطارة',
                        code: 'code',
                        barcode: '101024',
                        unit: 'كغ',
                      );
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

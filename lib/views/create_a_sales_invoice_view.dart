import 'package:chnan/widgets/custom_button_save.dart';
import 'package:chnan/widgets/text_field_barcode.dart';
import 'package:flutter/material.dart';

class CreateASalesInvoiceView extends StatelessWidget {
  const CreateASalesInvoiceView({super.key});
  static String id = 'CreateASalesInvoice';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFieldBaracode(controller: TextEditingController()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text('ماسح الباركود')),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  // InvoiceItemCard(
                  //   materialName: 'اسم المادة',
                  //   materialNameNumber: '1',
                  //   unit1: 'قطعة',
                  //   unit2: 'علبة',
                  //   context: context,
                  //   priceController: TextEditingController(text: '1000'),
                  //   quantityController: TextEditingController(text: '2'),
                  //   totalController: TextEditingController(text: '2000'),
                  //   bounsContoler: TextEditingController(text: '0'),
                  //   isNumericOnly: true,
                  // ),
                  // يمكنك تكرار عنصر InvoiceItemCard لتمثيل عدة مواد
                ],
              ),
            ),

            // الأزرار السفلية
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonSave(label: 'إلغاء', onTap: () {}),
                  CustomButtonSave(label: 'التالي', onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

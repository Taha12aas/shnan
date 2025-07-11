import 'package:chnan/utils/const.dart';
import 'package:chnan/widgets/custom_button_save.dart';
import 'package:chnan/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

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
            // شريط البحث
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomTextField(
                controller: TextEditingController(),
                focusNode: FocusNode(),
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.barcode, color: kAppColor),
                ),
                hintText: 'ادخل اسم المادة أو الكود',
              ),
            ),

            // ماسح الباركود (مكانه فارغ في التصميم فقط)
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

            // قائمة العناصر في الفاتورة
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

import 'package:chnan/widgets/custom_button_save.dart';
import 'package:chnan/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddInvoiceDetailsView extends StatelessWidget {
  const AddInvoiceDetailsView({super.key});
  static String id = 'AddInvoiceDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تفاصيل الفاتورة')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 15,
            children: [
              CustomTextField(
                hintText: 'اسم الحساب',
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              CustomTextField(
                hintText: 'ملاحظات',
                controller: TextEditingController(),
                focusNode: FocusNode(),
              ),
              Spacer(),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  CustomButtonSave(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    label: 'إلغاء',
                  ),
                  CustomButtonSave(onTap: () {}, label: 'حفظ'),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

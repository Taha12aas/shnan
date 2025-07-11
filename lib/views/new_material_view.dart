import 'package:chnan/utils/const.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/utils/responsive_text.dart';
import 'package:chnan/widgets/custom_button_save.dart';
import 'package:chnan/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class NewMedicineView extends StatefulWidget {
  const NewMedicineView({super.key});
  static String id = 'NewMedicineView';
  @override
  State<NewMedicineView> createState() => _NewMedicineViewState();
}

class _NewMedicineViewState extends State<NewMedicineView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final internalCodeController = TextEditingController();
  final barcodeController = TextEditingController();
  final unitController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    internalCodeController.dispose();
    barcodeController.dispose();
    unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'مادة جديدة',
          style: FontStyleApp.white18.copyWith(
            fontSize: getResponsiveText(context, 18),
          ),
        ),
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
                controller: codeController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                focusNode: FocusNode(),
                hintText: 'بركود المادة',
                controller: codeController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                focusNode: FocusNode(),
                hintText: 'كود المادة للمحاسب',
                controller: codeController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                focusNode: FocusNode(),
                hintText: 'كمية المادة',
                controller: codeController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                focusNode: FocusNode(),
                hintText: 'الوحدة',
                controller: codeController,
              ),

              const SizedBox(height: 20),
              CustomButtonSave(
                label: 'اضافة مادة',

                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print('الاسم: ${nameController.text}');
                    print('الكود: ${codeController.text}');
                    print('الداخلي: ${internalCodeController.text}');
                    print('الباركود: ${barcodeController.text}');
                    print('الوحدة: ${unitController.text}');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

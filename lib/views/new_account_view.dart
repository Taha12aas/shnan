import 'package:chnan/utils/const.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/utils/responsive_text.dart';
import 'package:chnan/widgets/custom_button_save.dart';
import 'package:chnan/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class NewAccountView extends StatefulWidget {
  const NewAccountView({super.key});
  static String id = 'NewAccountView';

  @override
  State<NewAccountView> createState() => _NewAccountViewState();
}

class _NewAccountViewState extends State<NewAccountView> {
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? selectedAccountType;
  final List<String> accountTypes = ['زبون', 'مورد', 'موظف'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'حساب جديد',
          style: FontStyleApp.white18.copyWith(
            fontSize: getResponsiveText(context, 18),
          ),
        ),
        backgroundColor: kAppColor,
        iconTheme: IconThemeData(color: Colors.white), // أيقونة الرجوع بيضاء
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: 'اسم الحساب',
                controller: nameController,
                focusNode: FocusNode(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'يرجى إدخال الاسم';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                alignment: Alignment.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  labelText: 'نوع الحساب',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                value: selectedAccountType,
                items:
                    accountTypes
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        
                        .toList(),
                onChanged:
                    (value) => setState(() {
                      selectedAccountType = value;
                    }),
                validator: (value) {
                  if (value == null) return 'يرجى اختيار نوع الحساب';
                  return null;
                },
              ),
              const Spacer(),
              CustomButtonSave(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم إضافة الحساب بنجاح')),
                    );
                    Navigator.pop(context);
                  }
                },
                label: 'اضافة حساب',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

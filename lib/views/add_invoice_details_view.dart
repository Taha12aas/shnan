import 'package:chnan/widgets/custom_button_save.dart';
import 'package:chnan/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddInvoiceDetailsView extends StatefulWidget {
  const AddInvoiceDetailsView({super.key});
  static String id = 'AddInvoiceDetailsView';

  @override
  State<AddInvoiceDetailsView> createState() => _AddInvoiceDetailsViewState();
}

class _AddInvoiceDetailsViewState extends State<AddInvoiceDetailsView> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تفاصيل الفاتورة')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'اسم الحساب',
                controller: accountController,
                focusNode: FocusNode(),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: CustomTextField(
                    hintText: 'تاريخ الفاتورة',
                    controller: dateController,
                    focusNode: FocusNode(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'ملاحظات',
                controller: notesController,
                focusNode: FocusNode(),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonSave(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    label: 'إلغاء',
                  ),
                  SizedBox(width: 65),
                  CustomButtonSave(
                    onTap: () {
                      // نفذ عملية الحفظ هنا
                      // send invoice model to cubit
                    },
                    label: 'حفظ',
                  ),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

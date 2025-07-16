import 'package:chnan/utils/const.dart';
import 'package:chnan/views/material_statement_result_view.dart';
import 'package:chnan/widgets/custom_button_save.dart';
import 'package:chnan/widgets/custom_text_field.dart'; // استيراد الـ CustomTextField
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MaterialStatementView extends StatefulWidget {
  const MaterialStatementView({super.key});
  static String id = 'MaterialStatementView';

  @override
  State<MaterialStatementView> createState() => _MaterialStatementViewState();
}

class _MaterialStatementViewState extends State<MaterialStatementView> {
  final List<String> accounts = ['زبون 1', 'مورد 2', 'زبون 3', 'مورد 4'];
  String? selectedAccount;

  DateTime fromDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime toDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  final FocusNode accountFocusNode = FocusNode();
  final FocusNode fromDateFocusNode = FocusNode();
  final FocusNode toDateFocusNode = FocusNode();

  final TextEditingController accountController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fromDateController.text = dateFormat.format(fromDate);
    toDateController.text = dateFormat.format(toDate);
  }

  @override
  void dispose() {
    accountFocusNode.dispose();
    fromDateFocusNode.dispose();
    toDateFocusNode.dispose();

    accountController.dispose();
    fromDateController.dispose();
    toDateController.dispose();

    super.dispose();
  }

  void _goToResultsPage() {
    if (selectedAccount == null || selectedAccount!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kRed,
          content: Text('يرجى اختيار الحساب'),
        ),
      );
      return;
    }
    if (toDate.isBefore(fromDate)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('التاريخ "إلى" يجب أن يكون بعد "من"')),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      MaterialStatementResultView.id,
      arguments: {'account': selectedAccount!, 'from': fromDate, 'to': toDate},
    );
  }

  Future<void> _pickDate(
    TextEditingController controller,
    FocusNode focusNode,
    bool isFrom,
  ) async {
    final initialDate = isFrom ? fromDate : toDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
          fromDateController.text = dateFormat.format(picked);
        } else {
          toDate = picked;
          toDateController.text = dateFormat.format(picked);
        }
      });
    }
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return accounts.where(
                  (account) => account.toLowerCase().contains(
                    textEditingValue.text.toLowerCase(),
                  ),
                );
              },
              onSelected: (value) {
                setState(() {
                  selectedAccount = value;
                  accountController.text = value;
                });
              },
              fieldViewBuilder: (
                context,
                controller,
                focusNode,
                onEditingComplete,
              ) {
                accountController.text = selectedAccount ?? controller.text;
                return CustomTextField(
                  hintText: 'اختر الحساب',
                  controller: accountController,
                  focusNode: accountFocusNode,
                  onChanged: (val) {
                    setState(() {
                      selectedAccount = val;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'من',
                    controller: fromDateController,
                    focusNode: fromDateFocusNode,
                    canRead: true,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed:
                          () => _pickDate(
                            fromDateController,
                            fromDateFocusNode,
                            true,
                          ),
                    ),
                    onChanged: (_) {},
                    keyType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    hintText: 'إلى',
                    controller: toDateController,
                    focusNode: toDateFocusNode,
                    canRead: true,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed:
                          () => _pickDate(
                            toDateController,
                            toDateFocusNode,
                            false,
                          ),
                    ),
                    onChanged: (_) {},
                    keyType: TextInputType.datetime,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: CustomButtonSave(
                label: 'عرض الكشف',
                onTap: _goToResultsPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

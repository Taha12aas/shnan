import 'package:chnan/utils/const.dart';
import 'package:chnan/utils/custom_Floating_action_button.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/utils/responsive_text.dart';
import 'package:chnan/views/new_account_view.dart';
import 'package:chnan/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});
  static String id = 'AccountsView';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'ابحث عن حساب',
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                ),
                SizedBox(height: 10),
                Card(
                  color: kAppColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 11,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'طه حوراني',
                              style: FontStyleApp.white18.copyWith(
                                fontSize: getResponsiveText(context, 16),
                              ),
                            ),
                            Text(
                              ': الاسم',
                              style: FontStyleApp.white18.copyWith(
                                fontSize: getResponsiveText(context, 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'مورد',
                              style: FontStyleApp.white18.copyWith(
                                fontSize: getResponsiveText(context, 16),
                              ),
                            ),
                            Text(
                              ': نوع الحساب',
                              style: FontStyleApp.white18.copyWith(
                                fontSize: getResponsiveText(context, 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          right: 16,
          child: CustomFloatingActionButton(
            hint: 'اضافة حساب',

            onPressed: () {
              Navigator.pushNamed(context, NewAccountView.id);
            },
          ),
        ),
      ],
    );
  }
}

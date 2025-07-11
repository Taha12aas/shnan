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
                  elevation: 6,
                  shadowColor: Colors.black.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.person, color: kAppColor, size: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'الاسم',
                                  style: FontStyleApp.appColor18.copyWith(
                                    fontSize: getResponsiveText(context, 14),
                                  ),
                                ),
                                Text(
                                  'طه حوراني',
                                  style: FontStyleApp.black18.copyWith(
                                    fontSize: getResponsiveText(context, 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.account_balance_wallet,
                              color: kAppColor,
                              size: 28,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'نوع الحساب',
                                  style: FontStyleApp.appColor18.copyWith(
                                    fontSize: getResponsiveText(context, 14),
                                  ),
                                ),
                                Text(
                                  'مورد',
                                  style: FontStyleApp.black18.copyWith(
                                    fontSize: getResponsiveText(context, 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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

import 'package:chnan/utils/const.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/utils/responsive_text.dart';
import 'package:flutter/material.dart';

class CustomButtonSave extends StatelessWidget {
  const CustomButtonSave({super.key, required this.onTap, required this.label});
  final void Function()? onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 100,
        decoration: BoxDecoration(
          color: kAppColor,
          border: Border.all(color: kAppColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            label,
            style: FontStyleApp.white18.copyWith(
              fontSize: getResponsiveText(context, 14),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

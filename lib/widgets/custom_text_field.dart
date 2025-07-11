import 'package:chnan/utils/const.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.canRead,
    this.prefixIcon,
    this.onChanged,
    required this.focusNode,
    this.textDirection,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? canRead;
  final void Function(String)? onChanged;
  final FocusNode focusNode;
  final TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection ?? TextDirection.rtl,
      child: TextFormField(
        focusNode: focusNode,
        onChanged: onChanged,
        readOnly: (canRead == null || canRead == false) ? false : true,
        validator: validator,
        keyboardType: keyType,
        controller: controller,
        textDirection: textDirection ?? TextDirection.rtl,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          label: Text(hintText, style: TextStyle(color: kAppColor)),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          fillColor: kWhite,
          filled: true,
          enabledBorder: borderStyle(),

          border: borderStyle(),
          focusedBorder: borderStyle(),
          errorBorder: borderErrorStyle(),
          focusedErrorBorder: borderErrorStyle(),
          errorStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: kBlacCustomk),
      borderRadius: BorderRadius.circular(8),
    );
  }

  OutlineInputBorder borderErrorStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(8),
    );
  }
}

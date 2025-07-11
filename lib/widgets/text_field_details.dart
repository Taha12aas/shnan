import 'package:chnan/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
class TextFieldAndDetails extends StatelessWidget {
  const TextFieldAndDetails({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyType = TextInputType.text,
    this.validator,
    this.icon,
    this.canRead,
    required this.focusNode,  this.onChangedl,
  });
  final FocusNode focusNode;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyType;
  final String? Function(String?)? validator;
  final Widget? icon;
  final bool? canRead;
  final Function(String)? onChangedl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        spacing: 25,
        children: [
          Expanded(
            child: CustomTextField(
              onChanged: onChangedl,
              focusNode: focusNode,
              canRead: canRead,
              suffixIcon: icon,
              validator: validator,
              hintText: hintText,
              controller: controller,
              keyType: keyType,
            ),
          ),
        ],
      ),
    );
  }
}

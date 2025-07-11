import 'package:chnan/utils/const.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.hint,
  });
  final VoidCallback onPressed;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      shape: CircleBorder(),
      tooltip: hint,
      backgroundColor: kAppColor,
      onPressed: onPressed,
      child: Icon(Icons.add_circle_outline, color: kWhite, size: 30),
    );
  }
}

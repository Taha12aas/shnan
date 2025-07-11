import 'package:flutter/material.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/utils/responsive_text.dart';

class MedicineCard extends StatelessWidget {
  final String name;
  final String code;
  final String internalCode;
  final String barcode;
  final String unit;

  const MedicineCard({
    super.key,
    required this.name,
    required this.code,
    required this.internalCode,
    required this.barcode,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRow(context, 'اسم المادة:', name),
              _buildRow(context, 'الرمز الداخلي : ', internalCode),
              _buildRow(context, 'الوحدة : ', unit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Text(
              label,
              style: FontStyleApp.appColor18.copyWith(
                fontSize: getResponsiveText(context, 15),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: FontStyleApp.black18.copyWith(
                  fontSize: getResponsiveText(context, 16),
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

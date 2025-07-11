import 'package:flutter/material.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/utils/responsive_text.dart';
import 'package:chnan/utils/const.dart';

class MedicineCard extends StatelessWidget {
  final String name;
  final String count;
  final String internalCode;
  final String barcode;
  final String unit;

  const MedicineCard({
    super.key,
    required this.name,
    required this.count,
    required this.internalCode,
    required this.barcode,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      shadowColor: Colors.black.withOpacity(0.15),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(context, Icons.label, 'اسم المادة', name),
              _buildInfoRow(context, Icons.code, 'الكمية', count),
              if (internalCode.trim().isNotEmpty)
                _buildInfoRow(
                  context,
                  Icons.lock,
                  'الرمز الداخلي',
                  internalCode,
                ),
              _buildInfoRow(context, Icons.qr_code, 'الباركود', barcode),
              _buildInfoRow(context, Icons.straighten, 'الوحدة', unit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: kAppColor, size: 20),
          const SizedBox(width: 10),
          Text(
            '$label:',
            style: FontStyleApp.appColor18.copyWith(
              fontSize: getResponsiveText(context, 14),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: FontStyleApp.black18.copyWith(
                fontSize: getResponsiveText(context, 14),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

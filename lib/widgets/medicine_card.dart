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
  final String medicineId;
  final Future<void> Function() onDelete;

  const MedicineCard({
    super.key,
    required this.name,
    required this.count,
    required this.internalCode,
    required this.barcode,
    required this.unit,
    required this.medicineId,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      shadowColor: Colors.black.withOpacity(0.15),
      color: Colors.white,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(context, Icons.label, 'اسم المادة', name),
                  _buildInfoRow(context, Icons.code, 'الكمية', count),
                  if (internalCode.trim().isNotEmpty)
                    _buildInfoRow(context, Icons.lock, 'الرمز الداخلي', internalCode),
                  _buildInfoRow(context, Icons.qr_code, 'الباركود', barcode),
                  _buildInfoRow(context, Icons.straighten, 'الوحدة', unit),
                ],
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 8,
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _confirmDelete(context),
            ),
          ),
        ],
      ),
    );
  }
void _confirmDelete(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: const Text('هل أنت متأكد أنك تريد حذف هذه المادة؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();  // أغلق الـ dialog أولًا
              onDelete();                // نفذ الحذف بعد الإغلاق
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('حذف'),
          ),
        ],
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

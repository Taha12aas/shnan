import 'package:flutter/material.dart';

class MaterialStatementResultView extends StatelessWidget {
  static String id = 'MaterialStatementResultView';

  const MaterialStatementResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String account = args['account'];

    final List<Map<String, dynamic>> materials = [
      {'date': '2025-07-01', 'name': 'سكر', 'quantity': 5, 'type': 'مبيعات'},
      {'date': '2025-07-02', 'name': 'زيت', 'quantity': 3, 'type': 'مردود'},
      {'date': '2025-07-03', 'name': 'رز', 'quantity': 7, 'type': 'مبيعات'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('كشف المواد لـ $account')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('التاريخ')),
              DataColumn(label: Text('المادة')),
              DataColumn(label: Text('النوع')),
              DataColumn(label: Text('الكمية')),
            ],
            rows:
                materials.map((mat) {
                  return DataRow(
                    cells: [
                      DataCell(Text(mat['date'])),
                      DataCell(Text(mat['name'])),
                      DataCell(Text(mat['type'])),
                      DataCell(Text(mat['quantity'].toString())),
                    ],
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}

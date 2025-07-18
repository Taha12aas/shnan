class StockModel {
  final String medicineId;  // معرف الدواء (UUID)
  final double quantity;    // الكمية المتاحة في المخزون

  StockModel({
    required this.medicineId,
    required this.quantity,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      medicineId: json['medicine_id'],
      quantity: (json['quantity'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medicine_id': medicineId,
      'quantity': quantity,
    };
  }
}

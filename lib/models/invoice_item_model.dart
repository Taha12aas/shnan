class InvoiceItemModel {
  final String id;
  final String invoiceId;
  final String medicineId;
  final double quantity;

  InvoiceItemModel({
    required this.id,
    required this.invoiceId,
    required this.medicineId,
    required this.quantity,
  });

  factory InvoiceItemModel.fromJson(Map<String, dynamic> json) {
    return InvoiceItemModel(
      id: json['id'],
      invoiceId: json['invoice_id'],
      medicineId: json['medicine_id'],
      quantity: (json['quantity'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'invoice_id': invoiceId,
      'medicine_id': medicineId,
      'quantity': quantity,
    };
  }
}

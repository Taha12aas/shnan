class MedicineModel {
  final String id;
  final String name;
  final String internalCode;
  final String barcode;
  final String unit;
  final DateTime createdAt;

  MedicineModel({
    required this.id,
    required this.name,
    required this.internalCode,
    required this.barcode,
    required this.unit,
    required this.createdAt,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'],
      name: json['name'],
      internalCode: json['internal_code'],
      barcode: json['barcode'],
      unit: json['unit'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'internal_code': internalCode,
      'barcode': barcode,
      'unit': unit,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

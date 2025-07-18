class MedicineModel {
  /// المعرف الفريد للدواء (UUID)
  final String id;

  /// اسم الدواء
  final String name;

  /// الكود الداخلي الإداري (اختياري في المحاسبة)
  final String internalCode;

  /// رمز الباركود الخاص بالدواء
  final String barcode;

  /// وحدة القياس (مثلاً: علبة، قطعه، لتر)
  final String unit;

  MedicineModel({
    required this.id,
    required this.name,
    required this.internalCode,
    required this.barcode,
    required this.unit,
  });

  /// تحويل من JSON إلى كائن MedicineModel
  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'],
      name: json['name'],
      internalCode: json['internal_code'],
      barcode: json['barcode'],
      unit: json['unit'],
    );
  }

  /// تحويل كائن MedicineModel إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'internal_code': internalCode,
      'barcode': barcode,
      'unit': unit,
    };
  }
}

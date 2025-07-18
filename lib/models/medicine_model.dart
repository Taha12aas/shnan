class MedicineModel {
  final String? id;
  final String name;
  final String barcode;
  final String internalCode;
  final String unit;
  final bool isDeleted; // حقل جديد

  MedicineModel({
    this.id,
    required this.name,
    required this.barcode,
    required this.internalCode,
    required this.unit,
    this.isDeleted = false, // افتراضيًا غير محذوف
  });

  MedicineModel copyWith({
    String? id,
    String? name,
    String? barcode,
    String? internalCode,
    String? unit,
    bool? isDeleted,
  }) {
    return MedicineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      barcode: barcode ?? this.barcode,
      internalCode: internalCode ?? this.internalCode,
      unit: unit ?? this.unit,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
    id: json['id'] as String?,
    name: (json['name'] ?? '') as String,
    barcode: (json['barcode'] ?? '') as String,
    internalCode: (json['internal_code'] ?? '') as String,
    unit: (json['unit'] ?? '') as String,
    isDeleted: json['isdeleted'] == 1 || json['isdeleted'] == true,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'barcode': barcode,
    'internal_code': internalCode,
    'unit': unit,
    'isdeleted': isDeleted ? 1 : 0,
  };
}

class AccountModel {
  final String id;             // ضروري لتتبع الحساب
  final String name;
  final String type;           // 'farm', 'supplier', 'client'
  final DateTime createdAt;
  final DateTime? updatedAt;

  AccountModel({
    required this.id,
    required this.name,
    required this.type,
    required this.createdAt,
    this.updatedAt,
  });

  // من خريطة JSON إلى الكائن
  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  // من الكائن إلى خريطة JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class AccountModel {
  /// المعرّف الفريد للحساب (UUID)
  final String id;

  /// اسم الحساب (مثل اسم المزرعة أو الزبون)
  final String name;

  /// نوع الحساب: 'farm' (مزرعة)، 'supplier' (مورد)، 'client' (زبون)
  final String type;

  /// تاريخ إنشاء الحساب (يُسجل تلقائيًا عند الإضافة)
  final DateTime createdAt;

  AccountModel({
    required this.id,
    required this.name,
    required this.type,
    required this.createdAt,
  });

  /// تحويل بيانات JSON من Supabase إلى كائن AccountModel
  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  /// تحويل الكائن إلى JSON لإرساله أو حفظه في Supabase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

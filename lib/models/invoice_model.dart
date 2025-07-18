class InvoiceModel {
  /// المعرف الفريد للفاتورة (UUID - أساسي في قاعدة البيانات)
  final String id;

  /// معرف الحساب المرتبط بالفاتورة (مثل مزرعة أو زبون)
  final String accountId;

  /// معرف المستخدم (الدكتور) الذي أنشأ الفاتورة - يمكن أن يكون null إذا حُذف المستخدم
  final String? createdBy;

  /// نوع الفاتورة: 'purchase', 'sale', 'return_sale', 'transport'
  final String type;

  /// تاريخ إصدار الفاتورة
  final DateTime date;

  /// ملاحظات اختيارية تضاف على الفاتورة
  final String? notes;

  /// هل تم تدقيق الفاتورة من قبل المحاسب؟
  final bool checkedByAccountant;

  /// تاريخ إنشاء الفاتورة
  final DateTime createdAt;

  InvoiceModel({
    required this.id,
    required this.accountId,
    required this.createdBy,
    required this.type,
    required this.date,
    this.notes,
    this.checkedByAccountant = false,
    required this.createdAt,
  });

  /// إنشاء نسخة من الفاتورة من بيانات JSON (قادم من Supabase)
  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      id: json['id'],
      accountId: json['account_id'],
      createdBy: json['created_by'],
      type: json['type'],
      date: DateTime.parse(json['date']),
      notes: json['notes'],
      checkedByAccountant: json['checked_by_accountant'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  /// تحويل كائن الفاتورة إلى JSON لإرساله أو تخزينه
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account_id': accountId,
      'created_by': createdBy,
      'type': type,
      'date': date.toIso8601String(),
      'notes': notes,
      'checked_by_accountant': checkedByAccountant,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

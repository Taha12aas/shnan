class InvoiceModel {
  final String id; // id: uuid primary key
  final String accountId; // account_id
  final String? createdBy; // created_by (nullable)
  final String type; // type: 'purchase', 'sale', 'return_sale', 'transport'
  final DateTime date;
  final String? notes;
  final String? accountingNumber;
  final bool checkedByAccountant;
  final bool isEdited;
  final String? editReason;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final DateTime createdAt;

  InvoiceModel({
    required this.id,
    required this.accountId,
    required this.createdBy,
    required this.type,
    required this.date,
    this.notes,
    this.accountingNumber,
    this.checkedByAccountant = false,
    this.isEdited = false,
    this.editReason,
    this.lastModifiedAt,
    this.lastModifiedBy,
    required this.createdAt,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      id: json['id'],
      accountId: json['account_id'],
      createdBy: json['created_by'],
      type: json['type'],
      date: DateTime.parse(json['date']),
      notes: json['notes'],
      accountingNumber: json['accounting_number'],
      checkedByAccountant: json['checked_by_accountant'] ?? false,
      isEdited: json['is_edited'] ?? false,
      editReason: json['edit_reason'],
      lastModifiedAt: json['last_modified_at'] != null
          ? DateTime.parse(json['last_modified_at'])
          : null,
      lastModifiedBy: json['last_modified_by'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account_id': accountId,
      'created_by': createdBy,
      'type': type,
      'date': date.toIso8601String(),
      'notes': notes,
      'accounting_number': accountingNumber,
      'checked_by_accountant': checkedByAccountant,
      'is_edited': isEdited,
      'edit_reason': editReason,
      'last_modified_at': lastModifiedAt?.toIso8601String(),
      'last_modified_by': lastModifiedBy,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

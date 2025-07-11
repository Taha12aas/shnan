
class InvoiceModel {

  late String invoiceId; // ID من Supabase
  late String accountId;
  late String createdBy;
  late String type; // sale, purchase, return_sale, transport
  late DateTime date;
  String? notes;
  String? accountingNumber;
  bool checkedByAccountant = false;
  bool isEdited = false;
  String? editReason;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  late DateTime createdAt;
}

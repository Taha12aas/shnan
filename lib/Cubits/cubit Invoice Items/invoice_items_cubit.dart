import 'package:chnan/Cubits/cubit%20Invoice%20Items/Iinvoice_items_States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chnan/models/invoice_item_model.dart';
import 'package:chnan/services/invoice_item_service.dart'; 

class InvoiceItemsCubit extends Cubit<InvoiceItemsStates> {
  InvoiceItemsCubit() : super(InvoiceItemsInitial());

  /// جلب كل العناصر
  Future<void> fetchAllItems() async {
    emit(InvoiceItemsLoading());
    try {
      final data = await InvoiceItemService.fetchInvoiceItems();
      final items = data.map((e) => InvoiceItemModel.fromJson(e)).toList();
      emit(InvoiceItemsSuccess(items: items));
    } catch (e) {
      emit(InvoiceItemsFailure(errorMessage: e.toString()));
    }
  }

  /// جلب العناصر حسب رقم الفاتورة
  Future<void> fetchItemsByInvoice(String invoiceId) async {
    emit(InvoiceItemsLoading());
    try {
      final data = await InvoiceItemService.fetchInvoiceItems();
      final items = data.map((e) => InvoiceItemModel.fromJson(e)).toList();
      emit(InvoiceItemsSuccess(items: items));
    } catch (e) {
      emit(InvoiceItemsFailure(errorMessage: e.toString()));
    }
  }

  /// إضافة عنصر جديد
  Future<void> addItem(InvoiceItemModel item) async {
    try {
      await InvoiceItemService.insertInvoiceItem(item);
      await fetchItemsByInvoice(item.invoiceId);
    } catch (e) {
      emit(InvoiceItemsFailure(errorMessage: e.toString()));
    }
  }

  /// تحديث عنصر
  Future<void> updateItem(String id, String invoiceId, Map<String, dynamic> values) async {
    try {
      await InvoiceItemService.updateInvoiceItem(id, values);
      await fetchItemsByInvoice(invoiceId);
    } catch (e) {
      emit(InvoiceItemsFailure(errorMessage: e.toString()));
    }
  }

  /// حذف عنصر
  Future<void> deleteItem(String id, String invoiceId) async {
    try {
      await InvoiceItemService.deleteInvoiceItem(id);
      await fetchItemsByInvoice(invoiceId);
    } catch (e) {
      emit(InvoiceItemsFailure(errorMessage: e.toString()));
    }
  }
}

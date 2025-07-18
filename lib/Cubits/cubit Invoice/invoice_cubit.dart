import 'package:chnan/Cubits/cubit%20Invoice/invoice_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chnan/models/invoice_model.dart';
import 'package:chnan/services/invoice_service.dart'; 

class InvoiceCubit extends Cubit<InvoiceStates> {
  InvoiceCubit() : super(InvoiceInitial());

  Future<void> fetchInvoices() async {
    emit(InvoiceLoading());
    try {
      final invoiceData = await InvoiceService.fetchInvoices();
      final invoices =
          invoiceData.map((e) => InvoiceModel.fromJson(e)).toList();
      emit(InvoiceSuccess(invoices: invoices));
    } catch (e) {
      emit(InvoiceFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addInvoice(InvoiceModel invoice) async {
    try {
      await InvoiceService.insertInvoice(invoice);
      await fetchInvoices();
    } catch (e) {
      emit(InvoiceFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateInvoice(String id, Map<String, dynamic> updatedValues) async {
    try {
      await InvoiceService.updateInvoice(id, updatedValues);
      await fetchInvoices();
    } catch (e) {
      emit(InvoiceFailure(errorMessage: e.toString()));
    }
  }

  Future<void> deleteInvoice(String id) async {
    try {
      await InvoiceService.deleteInvoice(id);
      await fetchInvoices();
    } catch (e) {
      emit(InvoiceFailure(errorMessage: e.toString()));
    }
  }
}

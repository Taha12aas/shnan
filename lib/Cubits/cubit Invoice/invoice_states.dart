import 'package:chnan/models/invoice_model.dart';

abstract class InvoiceStates {}

class InvoiceInitial extends InvoiceStates {}

class InvoiceLoading extends InvoiceStates {}

class InvoiceSuccess extends InvoiceStates {
  final List<InvoiceModel> invoices;
  InvoiceSuccess({required this.invoices});
}

class InvoiceFailure extends InvoiceStates {
  final String errorMessage;
  InvoiceFailure({required this.errorMessage});
}

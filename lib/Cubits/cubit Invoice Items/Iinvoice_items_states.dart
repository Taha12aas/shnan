import 'package:chnan/models/invoice_item_model.dart';

abstract class InvoiceItemsStates {}

class InvoiceItemsInitial extends InvoiceItemsStates {}

class InvoiceItemsLoading extends InvoiceItemsStates {}

class InvoiceItemsSuccess extends InvoiceItemsStates {
  final List<InvoiceItemModel> items;
  InvoiceItemsSuccess({required this.items});
}

class InvoiceItemsFailure extends InvoiceItemsStates {
  final String errorMessage;
  InvoiceItemsFailure({required this.errorMessage});
}

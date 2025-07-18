import 'package:chnan/models/medicine_model.dart';
import 'package:chnan/models/stock_model.dart';

abstract class StockState {}

class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<MedicineModel> medicines;
  final List<StockModel> stocks;

  StockLoaded({
    required this.medicines,
    required this.stocks,
  });
}

class StockError extends StockState {
  final String message;

  StockError(this.message);
}

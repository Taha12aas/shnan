import 'dart:developer';

import 'package:chnan/Cubits/cubit%20stock/stock_state.dart';
import 'package:chnan/models/medicine_model.dart';
import 'package:chnan/models/stock_model.dart';
import 'package:chnan/services/medicine_service.dart';
import 'package:chnan/services/stock_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockCubit extends Cubit<StockState> {
  StockCubit() : super(StockInitial());

  Future<void> fetchMedicinesAndStocks() async {
    emit(StockLoading());
    try {
      // جلب بيانات الأدوية
      final medicinesData = await MedicineService.fetchMedicines();
      final medicines =
          medicinesData.map((json) => MedicineModel.fromJson(json)).toList();

      // جلب بيانات المخزون
      final stocksData = await StockService.fetchStocks();
      final stocks =
          stocksData.map((json) => StockModel.fromJson(json)).toList();
      log('كميةالمواد :${stocksData.toString()}');
      emit(StockLoaded(medicines: medicines, stocks: stocks));
    } catch (e) {
      emit(StockError('حدث خطأ أثناء جلب بيانات المخزون'));
    }
  }

  // تحديث كمية دواء معين
  Future<void> updateStockQuantity(
    String medicineId,
    double newQuantity,
  ) async {
    try {
      await StockService.updateStockQuantity(medicineId, newQuantity);
      await fetchMedicinesAndStocks(); // إعادة تحميل البيانات بعد التحديث
    } catch (e) {
      emit(StockError('فشل تحديث كمية المخزون'));
    }
  }
}

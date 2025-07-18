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

      // حساب الكمية الكلية لكل مادة
      final Map<String, double> totalQuantities = {};
      for (var stock in stocks) {
        final id = stock.medicineId;
        totalQuantities[id] = (totalQuantities[id] ?? 0) + stock.quantity;
      }

      // طباعة الكميات الكلية
      log('الكميات الكلية: $totalQuantities');

      emit(
        StockLoaded(
          medicines: medicines,
          stocks: stocks,
          totalQuantities: totalQuantities, // أضفها إلى الحالة إذا بتحب
        ),
      );
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

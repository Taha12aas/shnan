import 'package:chnan/models/stock_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; 
class StockService {
  static final supabase = Supabase.instance.client;

  // جلب كل بيانات المخزون (stock)
  static Future<List<Map<String, dynamic>>> fetchStocks() async {
    return await supabase.from('stock').select();
  }

  // إدخال سجل جديد في المخزون (عادة ما تحتاجها فقط لإضافة دواء جديد)
  static Future<void> insertStock(StockModel stock) async {
    await supabase.from('stock').insert(stock.toJson());
  }

  // تحديث كمية المادة في المخزون
  static Future<void> updateStockQuantity(String medicineId, double quantity) async {
    await supabase
        .from('stock')
        .update({'quantity': quantity})
        .eq('medicine_id', medicineId);
  }

  // حذف سجل مخزون (في حال حذف دواء من النظام مثلاً)
  static Future<void> deleteStock(String medicineId) async {
    await supabase.from('stock').delete().eq('medicine_id', medicineId);
  }
}

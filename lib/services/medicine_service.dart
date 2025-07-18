 
import 'package:chnan/models/medicine_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicineService {
  static final supabase = Supabase.instance.client;
  static Future<List<Map<String, dynamic>>> fetchMedicines() async {
    final response = await supabase
        .from('medicines')
        .select()
        .eq('isdeleted', false); // أو .eq('isdeleted', 0) حسب نوع الحقل

    return response;
  }

  static Future<void> insertMedicine(MedicineModel medicine) async {
    await supabase.from('medicines').insert(medicine.toJson());
  }

  static Future<void> updateMedicine(
    String id,
    Map<String, dynamic> values,
  ) async {
    await supabase.from('medicines').update(values).eq('id', id);
  }

  static Future<void> deleteMedicine(String id) async {
    await supabase.from('medicines').update({'isdeleted': true}).eq('id', id);
  }
}

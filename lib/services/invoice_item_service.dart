
import 'package:chnan/models/invoice_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InvoiceItemService {
  static final supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchInvoiceItems() async {
    return await supabase.from('invoice_items').select();
  }

  static Future<void> insertInvoiceItem(InvoiceItemModel item) async {
    await supabase.from('invoice_items').insert(item.toJson());
  }

  static Future<void> updateInvoiceItem(String id, Map<String, dynamic> values) async {
    await supabase.from('invoice_items').update(values).eq('id', id);
  }

  static Future<void> deleteInvoiceItem(String id) async {
    await supabase.from('invoice_items').delete().eq('id', id);
  }
}
import 'package:chnan/models/invoice_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InvoiceService {
  static final supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchInvoices() async {
    return await supabase.from('invoices').select();
  }

  static Future<void> insertInvoice(InvoiceModel invoice) async {
    await supabase.from('invoices').insert(invoice.toJson());
  }

  static Future<void> updateInvoice(String id, Map<String, dynamic> values) async {
    await supabase.from('invoices').update(values).eq('id', id);
  }

  static Future<void> deleteInvoice(String id) async {
    await supabase.from('invoices').delete().eq('id', id);
  }
}
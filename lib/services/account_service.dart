import 'package:chnan/models/account_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountService {
  static final supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchAccounts() async {
    return await supabase.from('accounts').select();
  }

  static Future<void> insertAccount(AccountModel account) async {
    await supabase.from('accounts').insert(account.toJson());
  }

  static Future<void> updateAccount(
    String id,
    Map<String, dynamic> values,
  ) async {
    await supabase.from('accounts').update(values).eq('id', id);
  }

  static Future<void> deleteAccount(String id) async {
    await supabase.from('accounts').delete().eq('id', id);
  }
}

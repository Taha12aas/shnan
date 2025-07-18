import 'package:chnan/Cubits/cubit%20Account/account_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chnan/models/account_model.dart';
import 'package:chnan/services/account_service.dart'; 

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit() : super(AccountInitial());

  Future<void> fetchAccounts() async {
    emit(AccountLoading());
    try {
      final accountsData = await AccountService.fetchAccounts();
      final accounts = accountsData.map((e) => AccountModel.fromJson(e)).toList();
      emit(AccountSuccess(accounts: accounts));
    } catch (e) {
      emit(AccountFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addAccount(AccountModel account) async {
    try {
      await AccountService.insertAccount(account);
      await fetchAccounts();
    } catch (e) {
      emit(AccountFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateAccount(String id, Map<String, dynamic> updatedValues) async {
    try {
      await AccountService.updateAccount(id, updatedValues);
      await fetchAccounts();
    } catch (e) {
      emit(AccountFailure(errorMessage: e.toString()));
    }
  }

  Future<void> deleteAccount(String id) async {
    try {
      await AccountService.deleteAccount(id);
      await fetchAccounts();
    } catch (e) {
      emit(AccountFailure(errorMessage: e.toString()));
    }
  }
}

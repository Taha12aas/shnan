import 'package:chnan/models/account_model.dart';

abstract class AccountStates {}

class AccountInitial extends AccountStates {}

class AccountLoading extends AccountStates {}

class AccountSuccess extends AccountStates {
  final List<AccountModel> accounts;
  AccountSuccess({required this.accounts});
}

class AccountFailure extends AccountStates {
  final String errorMessage;
  AccountFailure({required this.errorMessage});
}

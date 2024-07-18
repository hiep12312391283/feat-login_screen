// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginStartedEvent extends LoginEvent {
  final String taxCode;
  final String account;
  final String password;
  const LoginStartedEvent({
    required this.taxCode,
    required this.account,
    required this.password,
  });
  @override
  List<Object> get props => [taxCode, account, password];
}

class TaxCodeChangedEvent extends LoginEvent {
  final String taxCode;
  const TaxCodeChangedEvent({required this.taxCode});
  @override
  List<Object> get props => [taxCode];
}

class AccountChangedEvent extends LoginEvent {
  final String account;
  const AccountChangedEvent({required this.account});
  @override
  List<Object> get props => [account];
}

class PasswordChangedEvent extends LoginEvent {
  final String password;
  const PasswordChangedEvent({required this.password});
  @override
  List<Object> get props => [password];
}

class IconTaxCodeClearEvent extends LoginEvent {}

class LoginButtonPressedEvent extends LoginEvent {}

class LoginToggleEyeEvent extends LoginEvent {}

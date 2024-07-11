// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginStarted extends LoginEvent {
  final String taxCode;
  final String account;
  final String password;
  const LoginStarted({
    required this.taxCode,
    required this.account,
    required this.password,
  });
  @override
  List<Object> get props => [taxCode, account, password];
}

class TaxCodeChanged extends LoginEvent {
  final String taxCode;
  final bool showCloseIcon;
  const TaxCodeChanged({required this.taxCode, this.showCloseIcon = false});
  @override
  List<Object> get props => [taxCode,showCloseIcon];
}

class AccountChanged extends LoginEvent {
  final String account;
  const AccountChanged({required this.account});
  @override
  List<Object> get props => [account];
}

class PasswordChanged extends LoginEvent {
  final String password;
  const PasswordChanged({required this.password});
  @override
  List<Object> get props => [password];
}

class IconTaxCodeClear extends LoginEvent {}

class LoginButtonPressed extends LoginEvent {}

class LoginToggleEye extends LoginEvent {}

class ShowCloseIcon extends LoginEvent {}

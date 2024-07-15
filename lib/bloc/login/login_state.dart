// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error;
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String? error;
  final bool isObscure;
  final String taxCode;
  final String account;
  final String password;
  const LoginState({
    this.status = LoginStatus.initial,
    this.error,
    this.isObscure = true,
    this.taxCode = '',
    this.account = '',
    this.password = '',
  });
  factory LoginState.initial() {
    return const LoginState(
      status: LoginStatus.initial,
    );
  }

  LoginState copyWith({
    LoginStatus? status,
    String? error,
    bool? isObscure,
    String? taxCode,
    String? account,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
      isObscure: isObscure ?? this.isObscure,
      taxCode: taxCode ?? this.taxCode,
      account: account ?? this.account,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props =>
      [status, error, isObscure, taxCode, account, password];
}

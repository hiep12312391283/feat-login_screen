
enum LoginStatus {
  initial,
  loading,
  success,
  error;
}

class LoginState {
  final LoginStatus status;
  final String? error;
  final bool isObscure;
  final String taxCode;
  final String account;
  final String password;
  LoginState({
    this.status = LoginStatus.initial,
    this.error,
    this.isObscure = true,
    this.taxCode = '',
    this.account = '',
    this.password = '',
  });

  LoginState copyWith({
    LoginStatus? status,
    String? error,
    bool? isObscure,
    bool? showCloseIcon,
    bool? showEyeIcon,
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
}

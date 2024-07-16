import 'package:get/get.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState {
  final Rx<LoginStatus> status;
  final RxString error;
  final RxBool isObscure;
  final RxString taxCode;
  final RxString account;
  final RxString password;

  LoginState({
    LoginStatus status = LoginStatus.initial,
    String error = '',
    bool isObscure = true,
    String taxCode = '',
    String account = '',
    String password = '',
  })  : status = status.obs,
        error = error.obs,
        isObscure = isObscure.obs,
        taxCode = taxCode.obs,
        account = account.obs,
        password = password.obs;

  LoginState copyWith({
    LoginStatus? status,
    String? error,
    bool? isObscure,
    String? taxCode,
    String? account,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status.value,
      error: error ?? this.error.value,
      isObscure: isObscure ?? this.isObscure.value,
      taxCode: taxCode ?? this.taxCode.value,
      account: account ?? this.account.value,
      password: password ?? this.password.value,
    );
  }
}

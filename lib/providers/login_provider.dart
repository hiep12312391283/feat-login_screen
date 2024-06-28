// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:login_screen/models/fake_account.dart';
import 'package:login_screen/models/user_repository.dart';

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
  final bool showCloseIcon;
  final bool showEyeIcon;
  final String taxCode;
  final String account;
  final String password;
  LoginState({
    this.status = LoginStatus.initial,
    this.error,
    this.isObscure = true,
    this.showCloseIcon = false,
    this.showEyeIcon = false,
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
      showCloseIcon: showCloseIcon ?? this.showCloseIcon,
      showEyeIcon: showEyeIcon ?? this.showEyeIcon,
      taxCode: taxCode ?? this.taxCode,
      account: account ?? this.account,
      password: password ?? this.password,
    );
  }
}

class LoginProvider extends ChangeNotifier {
  LoginState _loginState = LoginState();
  LoginState get loginState => _loginState;
  LoginStatus status = LoginStatus.initial;
  void setTaxCode(String value) {
    _loginState = _loginState.copyWith(taxCode: value);
    updateTaxCodeIcon();
    notifyListeners();
  }

  void setAccount(String value) {
    _loginState = _loginState.copyWith(account: value);
    notifyListeners();
  }

  void setPassword(String value) {
    _loginState = _loginState.copyWith(password: value);
    updatePassWordIcon();
    notifyListeners();
  }

  void updateTaxCodeIcon() {
    _loginState =
        _loginState.copyWith(showCloseIcon: _loginState.taxCode.isNotEmpty);
    notifyListeners();
  }

  void updatePassWordIcon() {
    _loginState =
        _loginState.copyWith(showEyeIcon: _loginState.password.isNotEmpty);
    notifyListeners();
  }

  void toggleEyeIcon() {
    _loginState = _loginState.copyWith(isObscure: !_loginState.isObscure);
    notifyListeners();
  }

  void login() async {
    _loginState = _loginState.copyWith(status: LoginStatus.loading);
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    try {
      // throw Exception("Web sap");
      if (_loginState.taxCode == FakeAccount.fakeAccount.taxCodeFake &&
          _loginState.account == FakeAccount.fakeAccount.accountFake &&
          _loginState.password == FakeAccount.fakeAccount.passwordFake) {
        _loginState = _loginState.copyWith(status: LoginStatus.success);
        UserRepository.setLoggedIn(true);
        UserRepository.saveTaxCode(_loginState.taxCode);
        UserRepository.saveAccount(_loginState.account);
        UserRepository.savePassword(_loginState.password);
        notifyListeners();
      }
    } catch (e) {
      _loginState =
          _loginState.copyWith(status: LoginStatus.error, error: e.toString());
      notifyListeners();
    } finally {
      _loginState =
          _loginState.copyWith(status: LoginStatus.initial, error: null);
      // error = null;
      notifyListeners();
    }
  }
}

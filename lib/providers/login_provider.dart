// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:login_screen/models/fake_account.dart';
import 'package:login_screen/models/login_state.dart';
import 'package:login_screen/models/user_repository.dart';

class LoginProvider extends ChangeNotifier {
  LoginState _loginState = LoginState();
  LoginState get loginState => _loginState;
  void setTaxCode(String value) {
    setValueState(taxCode: value);
  }

  void setAccount(String value) {
    setValueState(account: value);
  }

  void setPassword(String value) {
    setValueState(password: value);
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
      if (_loginState.taxCode == FakeAccount.fakeAccount.taxCodeFake &&
          _loginState.account == FakeAccount.fakeAccount.accountFake &&
          _loginState.password == FakeAccount.fakeAccount.passwordFake) {
        _loginState = _loginState.copyWith(status: LoginStatus.success);
        UserRepository.setLoggedIn(true);
        UserRepository.saveTaxCode(_loginState.taxCode);
        UserRepository.saveAccount(_loginState.account);
        UserRepository.savePassword(_loginState.password);
        notifyListeners();
      } else {
        throw Exception("Lỗi hệ thống");
      }
    } catch (e) {
      _loginState =
          _loginState.copyWith(status: LoginStatus.error, error: e.toString());
      notifyListeners();
    } finally {
      _loginState = _loginState.copyWith(
        status: LoginStatus.initial,
      );
      notifyListeners();
    }
  }

  void setValueState({String? taxCode,account,password}) {
    _loginState = _loginState.copyWith(
      taxCode: taxCode ?? _loginState.taxCode,
      account: account ?? _loginState.account,
      password: password ?? _loginState.password,
    );
    notifyListeners();
  }
}

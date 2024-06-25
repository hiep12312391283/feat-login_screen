import 'package:flutter/material.dart';
import 'package:login_screen/models/fake_account.dart';
import 'package:login_screen/models/user_repository.dart';

class AppProvider extends ChangeNotifier {
  bool _isLogged = UserRepository.isLoggedIn;
  bool get isLoggedIn => _isLogged;

  void login(String taxCode, String account, String password) {
    if (taxCode == FakeAccount.fakeAccount.taxCodeFake &&
        account == FakeAccount.fakeAccount.accountFake &&
        password == FakeAccount.fakeAccount.passwordFake) {
      _isLogged = true;
      UserRepository.setLoggedIn(true);
      UserRepository.saveTaxCode(taxCode);
      UserRepository.saveAccount(account);
      UserRepository.savePassword(password);
      notifyListeners();
    }
  }

  void logout() {
    _isLogged = false;
    UserRepository.setLoggedIn(false);
    notifyListeners();
  }
}

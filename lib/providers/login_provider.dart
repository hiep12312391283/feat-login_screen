import 'package:flutter/material.dart';
import 'package:login_screen/models/fake_account.dart';
import 'package:login_screen/models/user_repository.dart';

class LoginProvider extends ChangeNotifier {
  bool _isObscure = true;
  bool _showCloseIcon = false;
  bool _showEyeIcon = false;
  String _taxCode = '';
  String _account = '';
  String _password = '';
  AutovalidateMode _validateMode = AutovalidateMode.disabled;

  bool get isObscure => _isObscure;
  bool get showCloseIcon => _showCloseIcon;
  bool get showEyeIcon => _showEyeIcon;
  String get taxCode => _taxCode;
  String get account => _account;
  String get password => _password;
  AutovalidateMode get validateMode => _validateMode;

  void setTaxCode(String value) {
    _taxCode = value;
    notifyListeners();
  }
  

  void setAccount(String value) {
    _account = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void validateChanged() {
    _validateMode = AutovalidateMode.always;
    notifyListeners();
  }

  void updateTaxCodeIcon(String taxCode) {
    _showCloseIcon = taxCode.isNotEmpty;
    notifyListeners();
  }

  void updatePassWordIcon(String password) {
    _showEyeIcon = password.isNotEmpty;
    notifyListeners();
  }

  void toggleEyeIcon() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void login(BuildContext context, taxCode, String account, String password) {
    if (taxCode == FakeAccount.fakeAccount.taxCodeFake &&
        account == FakeAccount.fakeAccount.accountFake &&
        password == FakeAccount.fakeAccount.passwordFake) {
      UserRepository.setLoggedIn(true);
      UserRepository.saveTaxCode(taxCode);
      UserRepository.saveAccount(account);
      UserRepository.savePassword(password);
      notifyListeners();
    }
  }

  void logout(BuildContext context) {
    UserRepository.setLoggedIn(false);
    notifyListeners();
  }
}

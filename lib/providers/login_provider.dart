import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isObscure = true;
  bool _showCloseIcon = false;
  bool _showEyeIcon = false;
  AutovalidateMode _validateMode = AutovalidateMode.disabled;

  bool get isObscure => _isObscure;
  bool get showCloseIcon => _showCloseIcon;
  bool get showEyeIcon => _showEyeIcon;
  AutovalidateMode get validateMode => _validateMode;

  void validateChanged() {
    _validateMode = AutovalidateMode.always;
    notifyListeners();
  }

  void onTaxCodeTextFieldChanged(String taxCode) {
    _showCloseIcon = taxCode.isNotEmpty;
    notifyListeners();
  }

  void onPasswordTextFieldChanged(String password) {
    _showEyeIcon = password.isNotEmpty;
    notifyListeners();
  }

  void toggleEyeIcon() {
    _isObscure = !_isObscure;
    notifyListeners();
  }
}

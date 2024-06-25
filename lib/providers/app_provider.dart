import 'package:flutter/material.dart';
import 'package:login_screen/models/user_repository.dart';

class AppProvider extends ChangeNotifier {
  bool _isLoggedIn = UserRepository.isLoggedIn;
  bool get isLoggedIn => _isLoggedIn;

  void logout(BuildContext context) {
    UserRepository.setLoggedIn(false);
    notifyListeners();
  }
}

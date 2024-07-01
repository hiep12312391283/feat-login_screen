import 'package:flutter/material.dart';
import 'package:login_screen/models/user_repository.dart';

class AppProvider extends ChangeNotifier {
  bool get isLoggedIn => UserRepository.isLoggedIn;
  void logout() {
    UserRepository.setLoggedIn(false);
    notifyListeners();
  }
}

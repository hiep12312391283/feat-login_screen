import 'package:flutter/material.dart';
import 'package:login_screen/models/user_repository.dart';

class AppProvider extends ChangeNotifier {
  bool _isLogged = UserRepository.isLoggedIn;
  bool get isLoggedIn => _isLogged;
}

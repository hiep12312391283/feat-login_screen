import 'package:get/get.dart';
import 'package:login_screen/models/user_repository.dart';

class AppController extends GetxController {
  bool get isLoggedIn => UserRepository.isLoggedIn;

  void logout() {
    UserRepository.setLoggedIn(false);
  }
}

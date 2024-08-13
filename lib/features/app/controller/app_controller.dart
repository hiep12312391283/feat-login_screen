import 'package:get/get.dart';
import 'package:login_screen/base/hive_service.dart';

class AppController extends GetxController {
  bool get isLoggedIn => HiveService.isLoggedIn;

  void logout() {
    HiveService.setLoggedIn(false);
  }
}

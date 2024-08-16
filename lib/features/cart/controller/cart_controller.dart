import 'package:get/get.dart';
import 'package:login_screen/features/app/controller/app_controller.dart';

class CartController {
  final appController = Get.find<AppController>();

  void logout() {
    appController.logout();
  }
}

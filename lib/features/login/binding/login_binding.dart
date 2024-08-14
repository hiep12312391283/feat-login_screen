import 'package:get/get.dart';
import 'package:login_screen/features/login/controller/login_controller.dart';
import 'package:login_screen/features/login/repository/login_repo.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginRepo>(() => LoginRepo(),fenix: true);
  }
}

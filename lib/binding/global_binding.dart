import 'package:get/get.dart';
import 'package:login_screen/controllers/app_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
  }
}

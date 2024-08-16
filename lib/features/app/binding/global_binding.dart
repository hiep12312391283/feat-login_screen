import 'package:get/get.dart';
import 'package:login_screen/base/api_services.dart';
import 'package:login_screen/features/app/controller/app_controller.dart';
import 'package:login_screen/features/home/repository/list_product_repo.dart';
import 'package:login_screen/features/login/repository/login_repo.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController(), fenix: true);
    Get.lazyPut<ApiServices>(() => ApiServices(), fenix: true);
    Get.lazyPut<LoginRepo>(() => LoginRepo(), fenix: true);
    Get.lazyPut<ListProductRepo>(() => ListProductRepo(), fenix: true);
  }
}

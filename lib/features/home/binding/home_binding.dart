import 'package:get/get.dart';
import 'package:login_screen/features/home/repository/home_repo.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepo>(() => HomeRepo(), fenix: true);
  }
}

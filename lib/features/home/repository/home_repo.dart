import 'package:get/get.dart';
import 'package:login_screen/base/api_services.dart';
import 'package:login_screen/features/home/models/home_response.dart';

class HomeRepo {
  final ApiServices apiServices = Get.find();

  Future<HomeResponse> getHomeData({
    required int page,
    required int limit,
  }) async {
    final response =
        await apiServices.dio.get('/products?page=$page&size=$limit');
    return HomeResponse.fromJson(response.data);
  }
}

import 'package:get/get.dart';
import 'package:login_screen/base/api_services.dart';
import 'package:login_screen/features/home/models/home_response.dart';

class HomeRepo {
  final ApiServices apiServices = Get.find();

  Future<HomeResponse> getHomeData(
      {required int page, required int size}) async {
    try {
      final response =
          await apiServices.dio.get('/products?page=$page&size=$size');
      if (response.statusCode == 200) {
        return HomeResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}

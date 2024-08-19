import 'package:get/get.dart';
import 'package:login_screen/base/api_services.dart';
import 'package:login_screen/features/home/models/list_product_request.dart';
import 'package:login_screen/features/home/models/list_product_response.dart';

class ListProductRepo {
  final ApiServices apiServices = Get.find();
  Future<ListProductResponse> getListProduct(ListProductRequest request) async {
    final response = await apiServices.dio.get(
      '/products?page=${request.page}&size=${request.limit}',
    );
    return ListProductResponse.fromJson(response.data);
  }
}

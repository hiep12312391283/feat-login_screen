import 'package:get/get.dart';
import 'package:login_screen/base/api_services.dart';
import 'package:login_screen/features/detail_product/models/detail_product_request.dart';
import 'package:login_screen/features/detail_product/models/detail_product_response.dart';

class DetailProductRepo {
  final ApiServices apiServices = Get.find();
  Future<DetailProductResponse> fetchDetailProduct(
      DetailProductRequest request) async {
    final response = await apiServices.dio.get('/products/${request.id}');
    return DetailProductResponse.fromJson(response.data);
  }

  Future<DetailProductResponse> deleteProduct(
      DetailProductRequest request) async {
    final response = await apiServices.dio.delete('/products/${request.id}');
    print('${response.statusCode}');
    return DetailProductResponse.fromJson(response.data);
  }
}

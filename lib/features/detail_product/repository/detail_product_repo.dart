import 'package:get/get.dart';
import 'package:login_screen/base/api_services.dart';
import 'package:login_screen/features/detail_product/models/detail_product_response.dart';

class DetailProductRepo {
  final ApiServices apiServices = Get.find();

  Future<DetailProductResponse> fetchDetailProduct(int productId) async {
    final response = await apiServices.dio.get('/products/$productId');
    print('statuscode${ {response.statusCode}}');
    return DetailProductResponse.fromJson(response.data);
  }

  Future<DetailProductResponse> deleteProduct(int productId) async {
    final response = await apiServices.dio.delete('/products/$productId');
    print('${response.statusCode}');
    return DetailProductResponse.fromJson(response.data);
  }
}

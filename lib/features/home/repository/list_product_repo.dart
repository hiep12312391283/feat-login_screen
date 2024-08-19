import 'package:get/get.dart';
import 'package:login_screen/base/api_services.dart';
import 'package:login_screen/features/home/models/list_product_request.dart';
import 'package:login_screen/features/home/models/list_product_response.dart';
import 'package:dio/dio.dart';

class ListProductRepo {
  final ApiServices apiServices = Get.find();

  Future<ListProductResponse> getListProduct(ListProductRequest request) async {
    try {
      final response = await apiServices.dio.get(
        '/products?page=${request.page}&size=${request.limit}',
      );

      if (response.statusCode == 200) {
        return ListProductResponse.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Lỗi: ${response.statusCode} - ${response.statusMessage}',
        );
      }
    } on DioException {
      rethrow;
    }
  }
}

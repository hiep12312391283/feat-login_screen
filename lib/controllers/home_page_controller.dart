import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:login_screen/models/hive_service.dart';
import 'package:login_screen/models/product.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var page = 1.obs;
  final Dio dio = Dio();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    if (isLoading.value) return;
    isLoading.value = true;

    try {
      final token = await HiveService.getToken();
      if (token == null || token.isEmpty) {
        print('Token is missing or empty');
        return;
      }
      print('Token: $token');

      final response = await dio.get(
        'https://training-api-unrp.onrender.com/products',
        queryParameters: {'page': page.value, 'size': 10},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      List<Product> fetchedProducts = (response.data['products'] as List)
          .map((data) => Product.fromJson(data))
          .toList();

      if (page.value == 1) {
        products.assignAll(fetchedProducts);
      } else {
        products.addAll(fetchedProducts);
      }

      page.value++;
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> refreshProducts() async {
    page.value = 1;
    await fetchProducts();
  }
}

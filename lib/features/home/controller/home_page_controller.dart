import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:login_screen/base/hive_service.dart';
import 'package:login_screen/base/product.dart';

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

      final response = await dio.get(
        'https://training-api-unrp.onrender.com/products',
        queryParameters: {'page': page.value, 'size': 10},
        options: Options(
          headers: {'Authorization': ' $token'},
        ),
      );

      if (response.data != null && response.data['products'] != null) {
        print('${response.statusCode}');
        List<Product> fetchedProducts = (response.data['products'] as List)
            .map((data) => Product.fromJson(data))
            .toList();

        if (page.value == 1) {
          products.assignAll(fetchedProducts);
        } else {
          products.addAll(fetchedProducts);
        }

        page.value++;
      } else {
        print('${response.statusCode}');
        print('No products found.');
      }
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

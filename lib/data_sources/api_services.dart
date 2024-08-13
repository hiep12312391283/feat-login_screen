import 'package:dio/dio.dart';
import 'package:login_screen/models/hive_service.dart';
import 'package:login_screen/models/user.dart';

class ApiServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://training-api-unrp.onrender.com',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  ApiServices() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final token = HiveService.getToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          } catch (e) {
            print('Error getting token: $e');
          }
          print('Sending request to ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response received from ${response.requestOptions.uri}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('Request error: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  Future<bool> requestApi(User user) async {
    try {
      final response = await dio.post('/login', data: {
        'tax_code': user.taxCodeAuth,
        'user_name': user.accountAuth,
        'password': user.passwordAuth
      });
      if (response.statusCode == 200) {
        final token = response.data['token'];
        if (token != null) {
          await HiveService.saveToken(token);
          print('${token}');
        }
        print(response.data);
        return true;
      } else {
        print('Login failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Response> getProducts(int page, int size) async {
    try {
      final response = await dio.get('/products', queryParameters: {
        'page': page,
        'size': size,
      });
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Response> getProductDetail(int productId) async {
    try {
      final response = await dio.get('/products/$productId');
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Response> updateProduct(
      int productId, Map<String, dynamic> data) async {
    try {
      final response = await dio.put('/products/$productId', data: data);
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Response> deleteProduct(int productId) async {
    try {
      final response = await dio.delete('/products/$productId');
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Response> createProduct(Map<String, dynamic> data) async {
    try {
      final response = await dio.post('/products', data: data);
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

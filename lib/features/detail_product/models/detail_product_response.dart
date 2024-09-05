import 'package:login_screen/features/home/models/product.dart';

class DetailProductResponse {
  final bool success;
  final String message;
  final Product product;

  DetailProductResponse({
    required this.success,
    required this.message,
    required this.product,
  });

  factory DetailProductResponse.fromJson(Map<String, dynamic> json) =>
      DetailProductResponse(
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        product: Product.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": product.toJson(),
      };
}

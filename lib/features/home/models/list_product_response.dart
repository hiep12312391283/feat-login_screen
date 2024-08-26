import 'package:hive_flutter/hive_flutter.dart';
part 'list_product_response.g.dart';

class ListProductResponse {
  final bool success;
  final String message;
  final List<Product> data;

  ListProductResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ListProductResponse.fromJson(Map<String, dynamic> json) =>
      ListProductResponse(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
        data: json["data"] != null
            ? List<Product>.from(json["data"].map((x) => Product.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 1, adapterName: 'ProductAdapter')
class Product extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int price;

  @HiveField(3)
  final int quantity;

  @HiveField(4)
  final String cover;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.cover,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        price: json["price"] ?? 0,
        quantity: json["quantity"] ?? 0,
        cover: json["cover"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "cover": cover,
      };
}

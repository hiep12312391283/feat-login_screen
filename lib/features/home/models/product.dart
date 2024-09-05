import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 1, adapterName: 'ProductAdapter')
class Product {
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

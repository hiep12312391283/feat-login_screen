class Product {
  final String name;
  final double price;
  final String cover;

  Product({required this.name, required this.price, required this.cover});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'].toDouble(),
      cover: json['cover'],
    );
  }
}

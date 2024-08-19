class CreateProductRequest {
  final int id;
  final String name;
  final int price;
  final int quantity;
  final String cover;

  CreateProductRequest({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.cover,
  });
}

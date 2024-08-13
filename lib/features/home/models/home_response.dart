class HomeResponse {
  final bool success;
  final String message;
  final List<Data> data;

  HomeResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        success: json["success"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  final int id;
  final String name;
  final int price;
  final int quantity;
  final String cover;

  Data({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.cover,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "cover": cover,
      };
}

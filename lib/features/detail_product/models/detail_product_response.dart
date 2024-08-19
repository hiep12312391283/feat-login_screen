class DetailProductResponse {
  final bool success;
  final String message;

  DetailProductResponse({
    required this.success,
    required this.message,
  });
  factory DetailProductResponse.fromJson(Map<String, dynamic> json) =>
      DetailProductResponse(success: json["success"], message: json["message"]);
  Map<String, dynamic> toJson() => {"success": success, "message": message};
}

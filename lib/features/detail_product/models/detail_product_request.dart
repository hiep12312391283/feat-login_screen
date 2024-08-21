class DetailProductRequest {
  final int id;

  DetailProductRequest({
    required this.id,
  });
  factory DetailProductRequest.fromJson(Map<String, dynamic> json) =>
      DetailProductRequest(id: json["id"] ?? 0);

  Map<String, dynamic> toJson() => {"id": id};
}

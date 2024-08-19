class DetailProductRequest {
  final int id;

  DetailProductRequest({
    required this.id,
  });
  factory DetailProductRequest.fromJson(Map<String, dynamic> json) =>
      DetailProductRequest(id: json["id"]);

  Map<String, dynamic> toJson() => {"id": id};
}

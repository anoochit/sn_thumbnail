import 'dart:convert';

// To parse this JSON data, do
//
//     final genImage = genImageFromJson(jsonString);

List<GenImage> genImageFromJson(String str) =>
    List<GenImage>.from(json.decode(str).map((x) => GenImage.fromJson(x)));

String genImageToJson(List<GenImage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenImage {
  String? image;

  GenImage({
    this.image,
  });

  GenImage copyWith({
    String? image,
  }) =>
      GenImage(
        image: image ?? this.image,
      );

  factory GenImage.fromJson(Map<String, dynamic> json) => GenImage(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

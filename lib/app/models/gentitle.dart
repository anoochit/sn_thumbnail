import 'dart:convert';

// To parse this JSON data, do
//
//     final genTitle = genTitleFromJson(jsonString);

List<GenTitle> genTitleFromJson(String str) =>
    List<GenTitle>.from(json.decode(str).map((x) => GenTitle.fromJson(x)));

String genTitleToJson(List<GenTitle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenTitle {
  String? title;
  String? slug;
  String? tags;

  GenTitle({
    this.title,
    this.slug,
    this.tags,
  });

  factory GenTitle.fromJson(Map<String, dynamic> json) => GenTitle(
        title: json["title"],
        slug: json["slug"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "tags": tags,
      };
}

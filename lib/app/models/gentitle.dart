// To parse this JSON data, do
//
//     final genTitle = genTitleFromJson(jsonString);

import 'dart:convert';

List<GenTitle> genTitleFromJson(String str) =>
    List<GenTitle>.from(json.decode(str).map((x) => GenTitle.fromJson(x)));

String genTitleToJson(List<GenTitle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenTitle {
  String? title;
  String? tags;

  GenTitle({
    this.title,
    this.tags,
  });

  GenTitle copyWith({
    String? title,
    String? tags,
  }) =>
      GenTitle(
        title: title ?? this.title,
        tags: tags ?? this.tags,
      );

  factory GenTitle.fromJson(Map<String, dynamic> json) => GenTitle(
        title: json["title"],
        tags: json["tags"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "tags": tags,
      };
}

import 'package:isar/isar.dart';
part 'schemas.g.dart';

@collection
class Project {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? title;
  String? description;
  String? path;
}

@collection
class ImageGen {
  Id id = Isar.autoIncrement;
  @Index(type: IndexType.value)
  String? title;
  @Index(type: IndexType.value)
  String? prompt;
  int? width;
  int? height;
  String? path;
}

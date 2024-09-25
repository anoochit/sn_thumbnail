import 'package:isar/isar.dart';

part 'image_gen.g.dart';

@collection
class ImageGen {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? prompt;
  String? template;

  List<byte>? images;
}

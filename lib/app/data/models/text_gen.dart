import 'package:isar/isar.dart';

part 'text_gen.g.dart';

@collection
class TextGen {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? prompt;

  List<String>? contents;
}

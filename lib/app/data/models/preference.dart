import 'package:isar/isar.dart';

part 'preference.g.dart';

@collection
class Preference {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? geminiAPIKey;

  String? stabilityAPIKey;
}

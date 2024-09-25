import 'package:realm/realm.dart';

part 'schemas.realm.dart';

@RealmModel()
class _ImageGen {
  @PrimaryKey()
  late ObjectId id;
  late String prompt;
  late String template;
  late List<String> contents;
}

@RealmModel()
class _TextGen {
  @PrimaryKey()
  late ObjectId id;
  late String prompt;
  late List<String> contents;
}

@RealmModel()
class _Preference {
  @PrimaryKey()
  late ObjectId id;
  late String geminiAPIKey;
  late String stabilityAPIKey;
}

@RealmModel()
class _Project {
  @PrimaryKey()
  late ObjectId id;
  late String title;
  late String type;
  late int contentId;
}

@RealmModel()
class _Template {
  @PrimaryKey()
  late ObjectId id;
  late String title;
  late String template;
}

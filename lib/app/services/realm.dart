import 'dart:developer';

import 'package:realm/realm.dart';

import '../data/models/schemas.dart';

late Realm realm;

initRealm() async {
  final config = Configuration.local([
    ImageGen.schema,
    TextGen.schema,
    Preference.schema,
    Project.schema,
  ]);
  realm = Realm(config);

  log(config.path);
}

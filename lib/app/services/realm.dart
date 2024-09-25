import 'package:realm/realm.dart';

import '../data/models/schemas.dart';

late Realm realm;

initRealm() {
  final config = Configuration.local([
    ImageGen.schema,
    TextGen.schema,
    Preference.schema,
    Project.schema,
  ]);
  realm = Realm(config);
}

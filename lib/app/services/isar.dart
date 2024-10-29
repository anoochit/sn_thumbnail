import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/schemas.dart';

late Isar isar;

initIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [ProjectSchema, ImageGenSchema],
    directory: dir.path,
  );
}

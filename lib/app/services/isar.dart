// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sn_thumbnail/app/data/models/image_gen.dart';
import 'package:sn_thumbnail/app/data/models/project.dart';
import 'package:sn_thumbnail/app/data/models/text_gen.dart';

import '../data/models/preference.dart';

late Isar isar;

class DbService {
  // init
  Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        PreferenceSchema,
        ProjectSchema,
        ImageGenSchema,
        TextGenSchema,
      ],
      directory: dir.path,
    );

    return isar;
  }
}

import 'package:isar/isar.dart';

part 'project.g.dart';

@collection
class Project {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? title;

  @enumerated
  ProjectType type = ProjectType.text;

  int? data;
}

enum ProjectType {
  image,
  text,
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProjectCanvas {
  String title;
  double width;
  double height;
  ProjectCanvas({
    required this.title,
    required this.width,
    required this.height,
  });
}

final listCanvas = [
  ProjectCanvas(title: 'Facebook square', width: 1200.00, height: 1200.00),
];

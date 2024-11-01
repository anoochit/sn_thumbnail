// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProjectCanvas {
  String title;
  double width;
  double height;
  String ratio;
  ProjectCanvas({
    required this.title,
    required this.width,
    required this.height,
    required this.ratio,
  });
}

final listCanvas = [
  ProjectCanvas(
    title: 'FB square',
    width: 1200.00,
    height: 1200.00,
    ratio: "1:1",
  ),
  ProjectCanvas(
    title: 'FB Photo posts',
    width: 1200.00,
    height: 630.00,
    ratio: "1.91:1",
  ),
  ProjectCanvas(
    title: 'FB Business Page Cover',
    width: 1200.00,
    height: 674.00,
    ratio: "16:9",
  ),
  ProjectCanvas(
    title: 'FB Profile Cover',
    width: 1125.00,
    height: 633.00,
    ratio: "2.7:1",
  ),
  ProjectCanvas(
    title: 'FB Story',
    width: 1080.00,
    height: 1920.00,
    ratio: "9:16",
  ),
  ProjectCanvas(
    title: 'YT Thumbnail',
    width: 1280.00,
    height: 720.00,
    ratio: "16:9",
  ),
];

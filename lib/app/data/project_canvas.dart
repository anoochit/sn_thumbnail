import 'package:iconify_flutter/icons/fa_brands.dart';
import 'package:iconify_flutter/icons/fa_solid.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProjectCanvas {
  String title;
  double width;
  double height;
  String ratio;
  String icon;
  ProjectCanvas({
    required this.title,
    required this.width,
    required this.height,
    required this.ratio,
    required this.icon,
  });
}

final listCanvas = [
  ProjectCanvas(
    title: 'Square',
    width: 1200.00,
    height: 1200.00,
    ratio: "1:1",
    icon: FaBrands.facebook,
  ),
  ProjectCanvas(
    title: 'Photo posts',
    width: 1200.00,
    height: 630.00,
    ratio: "1.91:1",
    icon: FaBrands.facebook,
  ),
  ProjectCanvas(
    title: 'Page Cover',
    width: 1200.00,
    height: 674.00,
    ratio: "16:9",
    icon: FaBrands.facebook,
  ),
  ProjectCanvas(
    title: 'Profile Cover',
    width: 1125.00,
    height: 633.00,
    ratio: "2.7:1",
    icon: FaBrands.facebook,
  ),
  ProjectCanvas(
    title: 'Story',
    width: 1080.00,
    height: 1920.00,
    ratio: "9:16",
    icon: FaBrands.facebook,
  ),
  ProjectCanvas(
    title: 'Thumbnail',
    width: 1280.00,
    height: 720.00,
    ratio: "16:9",
    icon: FaBrands.youtube,
  ),
  ProjectCanvas(
    title: 'Pinto',
    width: 730.00,
    height: 310.00,
    ratio: "73:31",
    icon: FaSolid.book,
  ),
  ProjectCanvas(
    title: 'OG Image',
    width: 1200.00,
    height: 630.00,
    ratio: "1.91:1",
    icon: FaSolid.globe,
  ),
  ProjectCanvas(
    title: 'A4',
    width: 2480.00,
    height: 3508.00,
    ratio: "620:877",
    icon: FaSolid.file,
  ),
  ProjectCanvas(
    title: 'A5',
    width: 1748.00,
    height: 2480.00,
    ratio: "437:620",
    icon: FaSolid.file,
  ),
];

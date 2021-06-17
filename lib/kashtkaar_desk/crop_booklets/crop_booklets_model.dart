import 'package:flutter/material.dart';

class CropBookletsTile {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;

  const CropBookletsTile({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    this.tileColor = Colors.orange,
  });
}

import 'package:flutter/material.dart';

class CropDocumentTile {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;

  const CropDocumentTile({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    this.tileColor = Colors.orange,
  });
}

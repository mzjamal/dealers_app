import 'package:flutter/material.dart';

class KashtkaarDeskTile {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;

  const KashtkaarDeskTile({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    this.tileColor = Colors.orange,
  });
}

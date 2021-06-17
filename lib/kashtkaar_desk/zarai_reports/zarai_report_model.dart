import 'package:flutter/material.dart';

class ZaraiReportTile {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;

  const ZaraiReportTile({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    this.tileColor = Colors.orange,
  });
}

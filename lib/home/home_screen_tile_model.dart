import 'package:flutter/material.dart';

class HomeScreenTile {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;
  final String notifCount;

  const HomeScreenTile({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    this.tileColor = Colors.orange,
    this.notifCount,
  });
}

import 'package:flutter/material.dart';

class NotificationScreenTile {
  final String id;
  final String title;
  final String subTitle;
  final String notification;
  final Color tileColor;

  const NotificationScreenTile({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    @required this.notification,
    this.tileColor = Colors.orange,
  });
}

import 'package:flutter/material.dart';
import './other_notif_detail_screen.dart';

class OtherNotificationItem extends StatelessWidget {
  final String rowID;
  final String dealer;
  final String notCode;
  final String notDate;
  final String notTitle;
  final String notDesc;
  final String notEnd;
  final String readDate;
  final String recType;

  OtherNotificationItem({
    @required this.rowID,
    @required this.dealer,
    @required this.notCode,
    @required this.notDate,
    @required this.notTitle,
    @required this.notDesc,
    @required this.notEnd,
    @required this.readDate,
    @required this.recType,
  });

  Color _fontColor() {
    if (recType == 'NEW') {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  void _selectedNotification(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(OtherNotifDetailScreen.routeName, arguments: {
      'notifNo': rowID,
      'notifDate': notDate,
      'notifTitle': notTitle,
      'notifDesc': notDesc,
      'notifEnd': notEnd,
      'readDate': readDate,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedNotification(context),
      child: Card(
        color: Colors.grey.shade100,
        //color: Color(0xffb74093),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        rowID,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _fontColor(),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 10,
                  ),
                  alignment: Alignment.centerRight,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    'Read: ' + readDate,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        notTitle,
                        style: TextStyle(
                          fontSize: 18,
                          color: _fontColor(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        notDesc,
                        style: TextStyle(
                          fontSize: 18,
                          color: _fontColor(),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _fontColor(),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 10,
                  ),
                  alignment: Alignment.centerRight,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    'Issued: ' + notDate,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

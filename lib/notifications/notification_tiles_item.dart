import 'package:dealers_app/notifications/notifications_tiles_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../globals.dart';
import './invoices_new/invoices_noti_screen.dart';
import './fi_new/fi_new_notif_screen.dart';
import './fi_cancel/fi_cancel_noti_screen.dart';
import './orders_new/order_new_noti_screen.dart';
import './invoices_cancel/invoices_noti_screen.dart';
import './order_cancel/order_can_notif_screen.dart';
import './other_notif/other_notif_screen.dart';

class NotificationTilesItem extends StatelessWidget {
  final String id;
  final String title;
  final String subTitle;
  final String notification;
  //final Color tileColor;

  NotificationTilesItem(
    this.id,
    this.title,
    this.subTitle,
    this.notification,
    //this.tileColor,
  );

  final double _iconFontSize = 48;

  //final Color _iconColor = Colors.red.shade800;

  void _displayScreen(BuildContext ctx, String tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 'n1') {
      Navigator.of(ctx).pushNamed(OrdersNewNotifScreen.routeName).whenComplete(
          () => Navigator.of(ctx).pushNamed(NotificationTilesScreen.routeName));
    }
    if (tileID == 'n2') {
      Navigator.of(ctx)
          .pushNamed(InvoicesNotificationScreen.routeName)
          .whenComplete(() =>
              Navigator.of(ctx).pushNamed(NotificationTilesScreen.routeName));
    }
    if (tileID == 'n3') {
      Navigator.of(ctx)
          .pushNamed(OrderCancelNotifScreen.routeName)
          .whenComplete(() =>
              Navigator.of(ctx).pushNamed(NotificationTilesScreen.routeName));
    }
    if (tileID == 'n4') {
      Navigator.of(ctx)
          .pushNamed(InvoicesCanNotificationScreen.routeName)
          .whenComplete(() =>
              Navigator.of(ctx).pushNamed(NotificationTilesScreen.routeName));
    }
    if (tileID == 'n5') {
      Navigator.of(ctx)
          .pushNamed(FiNewNotificationScreen.routeName)
          .whenComplete(() =>
              Navigator.of(ctx).pushNamed(NotificationTilesScreen.routeName));
    }
    if (tileID == 'n6') {
      Navigator.of(ctx)
          .pushNamed(FiCancelNotificationScreen.routeName)
          .whenComplete(() =>
              Navigator.of(ctx).pushNamed(NotificationTilesScreen.routeName));
    }
    if (tileID == 'n7') {
      Navigator.of(ctx)
          .pushNamed(OtherNotificationScreen.routeName)
          .whenComplete(() =>
              Navigator.of(ctx).pushNamed(NotificationTilesScreen.routeName));
    }
  }

  Icon _displayIcon(BuildContext ctx, String tileID) {
    if (int.parse(notification) > 0) {
      return Icon(
        Icons.circle,
        color: Colors.red.shade800,
        size: _iconFontSize,
      );
    } else {
      return Icon(
        Icons.circle,
        color: Colors.green.shade600,
        size: _iconFontSize,
      );
    }

    // if (tileID == 'n1') {
    //   //pending order
    //   return Icon(
    //     Icons.circle,
    //     color: Globals.newOrderNotifications > 0
    //         ? Colors.red.shade800
    //         : Colors.green.shade600,
    //     size: _iconFontSize,
    //   );
    // }
    // if (tileID == 'n2') {
    //   //account balance
    //   return Icon(
    //     Icons.circle,
    //     color: Globals.newInvoiceNotifications > 0
    //         ? Colors.red.shade800
    //         : Colors.green.shade600,
    //     size: _iconFontSize,
    //   );
    // }
    // if (tileID == 'n3') {
    //   //DTP
    //   return Icon(
    //     Icons.circle,
    //     color: Colors.green.shade600,
    //     size: _iconFontSize,
    //   );
    // }
    // if (tileID == 'n4') {
    //   //Price List
    //   return Icon(
    //     Icons.circle,
    //     color: Colors.green.shade600,
    //     size: _iconFontSize,
    //   );
    // }
    // if (tileID == 'n5') {
    //   //Contact HOSD
    //   return Icon(
    //     Icons.circle,
    //     color: _iconColor,
    //     size: _iconFontSize,
    //   );
    // }
    // if (tileID == 'n6') {
    //   //About
    //   return Icon(
    //     //Icons.notification_important_outlined,
    //     Icons.circle,
    //     color: Colors.green.shade600,
    //     size: _iconFontSize,
    //   );
    // }
    // if (tileID == 'n7') {
    //   //About
    //   return Icon(
    //     //Icons.notification_important_outlined,
    //     Icons.circle,
    //     color: Colors.green.shade600,
    //     size: _iconFontSize,
    //   );
    // }
    // if (tileID == 'n8') {
    //   //About
    //   return Icon(
    //     //Icons.notification_important_outlined,
    //     Icons.circle,
    //     color: _iconColor,
    //     size: _iconFontSize,
    //   );
    // }
    // //to address warning of no return statement in the function
    // return Icon(
    //   Icons.circle,
    //   color: _iconColor,
    //   size: _iconFontSize,
    // );
  }

  double _fontSize() {
    if (Globals.varSize < const Size(360.0, 680.0)) {
      return 18;
    } else {
      return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _displayScreen(context, id),
      //splashColor: Theme.of(context).primaryColor,
      //so that wave effect could be of the same size as is the size of the tile
      //borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            //color: Color(0xFFF05A22),
            color: Colors.teal.shade900,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          //boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 3)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 5),
              width: 250,
              height: 40,
              // width: MediaQuery.of(context).size.width * 0.6,
              // height: MediaQuery.of(context).size.height * 0.05,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    // padding: const EdgeInsets.only(top: 5),
                    // color: Colors.transparent,
                    width: 250,
                    height: 40,
                    child: _displayIcon(context, id),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    // color: Colors.transparent,
                    padding: const EdgeInsets.only(top: 12),
                    width: 250,
                    height: 40,
                    child: Text(
                      notification,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: _fontSize(),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _fontSize(),
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.062,
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

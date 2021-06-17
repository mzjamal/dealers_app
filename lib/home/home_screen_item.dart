import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../pending_orders/po_summary_screen.dart';
import '../account_balance/account_balance_screen.dart';
import '../dtp/dtp_screen.dart';
import '../show_other_options/show_other_tiles.dart';
import '../notifications/notifications_tiles_screen.dart';
import '../home/home_tabs_screen.dart';

class HomeScreenItem extends StatelessWidget {
  final String id;
  final String title;
  final String subTitle;
  //final Color tileColor;
  final String notifCount;
  final double _iconFontSize = 44;
  final Color _iconColor = Colors.blue.shade900;
  final url =
      'https://ffcportal.ffc.com.pk:8881/opendocumentnew/ZPList.jsp?SDIST=' +
          Globals.globalSalesDist;

  HomeScreenItem(
    this.id,
    this.title,
    this.subTitle,
    this.notifCount,
  );

  void _displayScreen(BuildContext ctx, String tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 't1') {
      Navigator.of(ctx).pushNamed(PendingOrderSummaryScreen.routeName);
    }
    if (tileID == 't2') {
      Navigator.of(ctx).pushNamed(AccountBalanceScreen.routeName);
    }
    if (tileID == 't3') {
      Navigator.of(ctx).pushNamed(DealerTransferPrice.routeName);
    }
    if (tileID == 't4') {
      launch(url);
    }
    if (tileID == 't5') {
      Navigator.of(ctx)
          .pushNamed(NotificationTilesScreen.routeName)
          .whenComplete(
              () => Navigator.of(ctx).pushNamed(HomeTabsScreen.routeName));
    }
    if (tileID == 't6') {
      Navigator.of(ctx).pushNamed(ShowOtherTiles.routeName);
    }
  }

  Icon _displayIcon(BuildContext ctx, String tileID) {
    //Based on tile IDs, different icons are displayed
    if (tileID == 't1') {
      //pending order
      return Icon(
        Icons.local_shipping_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 't2') {
      //account balance
      return Icon(
        Icons.account_balance_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 't3') {
      //DTP
      return Icon(
        Icons.deck_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 't4') {
      //Price List
      return Icon(
        Icons.print_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 't5') {
      //Contact HOSD
      return Icon(
        Icons.notification_important_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 't6') {
      //About
      return Icon(
        //Icons.notification_important_outlined,
        Icons.touch_app_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    //to address warning of no return statement in the function
    return Icon(
      Icons.no_cell_outlined,
      color: _iconColor,
      size: _iconFontSize,
    );
  }

  double _fontSize() {
    if (Globals.varSize < const Size(360.0, 680.0)) {
      return 16;
    } else {
      return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    //we normally wrap container with GestureDetector or InkWell so that we may have
    //multiple listeners for tap, double tap etc.
    return InkWell(
      onTap: () => _displayScreen(context, id),
      //splashColor: Theme.of(context).primaryColor,
      //so that wave effect could be of the same size as is the size of the tile
      //borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            //color: Color(0xFFF05A22),
            color: Colors.teal.shade900,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  color: Colors.transparent,
                  //width: MediaQuery.of(context).size.width * 0.4,
                  width: double.infinity,
                  height: 20,
                  child: _displayIcon(context, id),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(top: 30),
                  //width: MediaQuery.of(context).size.width * 0.6,
                  width: double.infinity,
                  height: 48,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _fontSize(),
                      color: Colors.black,
                      //fontFamily: 'Urdu',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(top: 5),
                  width: double.infinity,
                  height: 35,
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Urdu',
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              padding: const EdgeInsets.only(
                top: 10,
                left: 130,
              ),
              width: double.infinity,
              height: 50,
              child: Text(
                notifCount,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

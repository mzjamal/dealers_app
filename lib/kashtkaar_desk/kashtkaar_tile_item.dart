import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import './crop_booklets/crop_booklets_screen.dart';
import './crop_documentaries/crop_doc_screen.dart';
import './zarai_reports/zarai_report_screen.dart';

class KashtkaarTileItem extends StatelessWidget {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;
  final double _iconFontSize = 64;
  final Color _iconColor = Colors.green.shade700;
  final String _urlAgri =
      'https://www.ffc.com.pk/wp-content/uploads/Agri-Experts-Contact-List-2.pdf';

  KashtkaarTileItem(this.id, this.title, this.subTitle, this.tileColor);

  void _displayScreen(BuildContext ctx, String tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 'k1') {
      Navigator.of(ctx).pushNamed(CropDocumentaryScreen.routeName);
    }
    if (tileID == 'k2') {
      Navigator.of(ctx).pushNamed(ZaraiReportScreen.routeName);
    }
    if (tileID == 'k3') {
      Navigator.of(ctx).pushNamed(CropBookletsScreen.routeName);
      //launch(_urlBooklets);
    }
    if (tileID == 'k4') {
      launch(_urlAgri);
    }
    if (tileID == 'k5') {
      launch(('tel://${'080000332'}'));
    }
  }

  Icon _displayIcon(BuildContext ctx, String tileID) {
    //Based on tile IDs, different icons are displayed
    if (tileID == 'k1') {
      //pending order
      return Icon(
        Icons.movie_creation_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'k2') {
      //account balance
      return Icon(
        Icons.receipt_long_rounded,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'k3') {
      //DTP
      return Icon(
        Icons.book_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'k4') {
      //Price List
      return Icon(
        Icons.supervised_user_circle_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'k5') {
      //About
      return Icon(
        //Icons.notification_important_outlined,
        Icons.phone_in_talk_outlined,
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
      return 20;
    } else {
      return 20;
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                top: 1,
                left: 20,
              ),
              color: Colors.transparent,
              //width: MediaQuery.of(context).size.width * 0.4,
              width: 20,
              height: 90,
              child: _displayIcon(context, id),
            ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(top: 1),
                  //width: MediaQuery.of(context).size.width * 0.6,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 25,
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
                  alignment: Alignment.topRight,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(top: 25),
                  //width: MediaQuery.of(context).size.width * 0.6,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: 'Urdu',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ZaraiReportItem extends StatelessWidget {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;
  final _urlJan =
      'https://www.ffc.com.pk/wp-content/uploads/ZR-Jan-Mar-2021.pdf';
  final _urlApr =
      'https://www.ffc.com.pk/wp-content/uploads/ZaraiReport-Apr-June-2021.pdf';
  final _urlJul =
      'https://www.ffc.com.pk/wp-content/uploads/Zarai-ReportJuly-September-2020.pdf';
  final _urlOct = 'https://www.ffc.com.pk/wp-content/uploads/ZR-OCT-DEC.pdf';

  ZaraiReportItem(this.id, this.title, this.subTitle, this.tileColor);

  void _displayScreen(BuildContext ctx, String tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 'z1') {
      launch(_urlJan);
    }
    if (tileID == 'z2') {
      launch(_urlApr);
    }
    if (tileID == 'z3') {
      launch(_urlJul);
    }
    if (tileID == 'z4') {
      launch(_urlOct);
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
            color: Colors.black,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                left: 4,
                top: 20,
              ),
              child: Icon(
                Icons.spa_outlined,
                color: Colors.green.shade200,
                size: 74,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(top: 5),
                  //width: MediaQuery.of(context).size.width * 0.6,
                  width: 170,
                  height: 60,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      //fontFamily: 'Urdu',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(top: 10),
                  //width: MediaQuery.of(context).size.width * 0.6,
                  width: 170,
                  height: 50,
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: 'Urdu',
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

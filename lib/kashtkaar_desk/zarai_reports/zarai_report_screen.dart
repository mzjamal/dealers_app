import 'package:flutter/material.dart';
import '../../home/home_tabs_screen.dart';
import '../../colors.dart';
import './zarai_report_tile_data.dart';
import './zarai_report_item.dart';

class ZaraiReportScreen extends StatefulWidget {
  static const routeName = '/zarai';
  @override
  _ZaraiReportScreenState createState() => _ZaraiReportScreenState();
}

class _ZaraiReportScreenState extends State<ZaraiReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Row(
            children: [
              Image.asset(
                'assets/images/ffc.png',
                height: 40,
                width: 70,
                //fit: BoxFit.fill,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  'Zarai Reports',
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomeTabsScreen.routeName);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              MyColors.backgroundColor1,
              MyColors.backgroundColor2,
              MyColors.backgroundColor3,
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.amber.shade400,
              width: MediaQuery.of(context).size.width,
              height: 60,
              padding: EdgeInsets.only(
                top: 10,
                //left: 10,
              ),
              child: Text(
                'زرعی رپورٹس',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 70,
              ),
              width: double.infinity,
              child: Text(
                'رپورٹ پڑھنے کیلئے کسی عنوان پر ٹیپ کریں',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 90,
                left: 15,
                right: 15,
              ),
              child: GridView(
                padding: const EdgeInsets.only(
                  top: 25,
                  bottom: 20,
                ),
                children: ZARAI_TILES
                    .map(
                      (tileData) => ZaraiReportItem(
                        tileData.id,
                        tileData.title,
                        tileData.subTitle,
                        tileData.tileColor,
                      ),
                    )
                    .toList(),
                //Sliver are scrollable areas on screen in Flutter
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

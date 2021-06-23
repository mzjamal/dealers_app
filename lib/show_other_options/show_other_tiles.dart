import 'package:flutter/material.dart';
import '../colors.dart';
import './show_other_tiles_data.dart';
import './show_other_tiles_item.dart';
import '../home/home_tabs_screen.dart';
import '../globals.dart';

class ShowOtherTiles extends StatefulWidget {
  static const routeName = '/showOther';
  @override
  _ShowOtherTilesState createState() => _ShowOtherTilesState();
}

class _ShowOtherTilesState extends State<ShowOtherTiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
                'Other Options',
                textAlign: TextAlign.right,
              ),
            ),
          ],
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
              height: 40,
              padding: EdgeInsets.only(
                top: 12,
                left: 10,
              ),
              child: Text(
                'WELCOME ' +
                    Globals.dealerName +
                    '  [' +
                    Globals.dealerCode +
                    ']',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Opacity(
                opacity: 0.1,
                child: Center(
                  child: Image.asset(
                    "assets/images/sona.png",
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.7,
                    //fit: BoxFit.fill,
                    //colorBlendMode: BlendMode.srcOver,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 40,
                left: 15,
                right: 15,
              ),
              child: GridView(
                padding: const EdgeInsets.only(
                  top: 10,
                  //bottom: 20,
                ),
                children: SHOW_OTHER_TILES
                    .map(
                      (tileData) => ShowOtherTilesItem(
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
                  childAspectRatio: 2.5 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

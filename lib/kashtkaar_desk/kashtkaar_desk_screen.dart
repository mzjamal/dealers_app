import 'package:flutter/material.dart';
import '../colors.dart';
import './kashtkaar_tile_item.dart';
import './kashtkaar_tiles_data.dart';

class KashtkaarDeskScreen extends StatefulWidget {
  static const routeName = '/kashtkaar';
  @override
  _KashtkaarDeskScreenState createState() => _KashtkaarDeskScreenState();
}

class _KashtkaarDeskScreenState extends State<KashtkaarDeskScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 45,
            padding: EdgeInsets.only(
              top: 5,
              //left: 10,
            ),
            child: Text(
              'کاشتکار ڈيسک',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Urdu',
              ),
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
              top: 90,
              left: 15,
              right: 15,
            ),
            child: GridView(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              children: KASHTKAAR_TILES
                  .map(
                    (tileData) => KashtkaarTileItem(
                      tileData.id,
                      tileData.title,
                      tileData.subTitle,
                      tileData.tileColor,
                    ),
                  )
                  .toList(),
              //Sliver are scrollable areas on screen in Flutter
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width,
                childAspectRatio: 8 / 1.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 60,
            ),
            width: double.infinity,
            child: Text(
              'تفصیل دیکھنے کیلئے کسی عنوان پر ٹیپ کریں',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Urdu',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

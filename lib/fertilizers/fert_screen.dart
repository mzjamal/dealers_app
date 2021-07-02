import 'package:flutter/material.dart';
import '../colors.dart';
import '../fertilizers/fert_tile_item.dart';
import '../fertilizers/fert_tiles_data.dart';
import '../home/home_tabs_screen.dart';

class FertilizersScreen extends StatefulWidget {
  static const routeName = '/fertScreen';

  @override
  _FertilizersScreenState createState() => _FertilizersScreenState();
}

class _FertilizersScreenState extends State<FertilizersScreen> {
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
                'Fertilizers',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                ),
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
              height: 45,
              padding: EdgeInsets.only(
                top: 5,
                //left: 10,
              ),
              child: Text(
                'ایف ایف سی کی کھادیں',
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
              //height: double.infinity,
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
                children: FERTILIZER_TILES
                    .map(
                      (tileData) => FertilizerTileItem(
                        tileData.id,
                        tileData.title,
                        tileData.subTitle,
                      ),
                    )
                    .toList(),
                //Sliver are scrollable areas on screen in Flutter
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 1 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 55,
              ),
              width: double.infinity,
              child: Text(
                'تفصیل دیکھنے کیلئے کسی عنوان پر ٹیپ کریں',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
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

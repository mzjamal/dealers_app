import 'package:flutter/material.dart';
import './crop_booklets_tile_data.dart';
import './crop_booklets_item.dart';
import '../../colors.dart';
import '../../home/home_tabs_screen.dart';

class CropBookletsScreen extends StatefulWidget {
  static const routeName = '/cropBook';
  @override
  _CropBookletsScreenState createState() => _CropBookletsScreenState();
}

class _CropBookletsScreenState extends State<CropBookletsScreen> {
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
                'Crop Booklets',
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
              height: 60,
              padding: EdgeInsets.only(
                top: 10,
                //left: 10,
              ),
              child: Text(
                'فصلوں کی کاشت کے کتابچے',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
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
                'کتابچہ پڑھنے کیلئے کسی عنوان پر ٹیپ کریں',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 100,
                left: 15,
                right: 15,
              ),
              child: GridView(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                children: BOOKLETS_TILES
                    .map(
                      (tileData) => CropBookletsItem(
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

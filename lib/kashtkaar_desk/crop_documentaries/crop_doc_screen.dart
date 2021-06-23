import 'package:flutter/material.dart';
import '../../home/home_tabs_screen.dart';
import '../../colors.dart';
import './crop_doc_tile_data.dart';
import './crop_doc_item.dart';

class CropDocumentaryScreen extends StatefulWidget {
  static const routeName = '/cropDocu';
  @override
  _CropDocumentaryScreenState createState() => _CropDocumentaryScreenState();
}

class _CropDocumentaryScreenState extends State<CropDocumentaryScreen> {
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
                'Crop Documentaries',
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
                'فصلوں کی دستاویزی فلمیں',
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
                'ویڈیو دیکھنے کیلئے کسی عنوان پر ٹیپ کریں',
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
                children: DOCUMENT_TILES
                    .map(
                      (tileData) => CropDocumentItem(
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
                  childAspectRatio: 3 / 2,
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

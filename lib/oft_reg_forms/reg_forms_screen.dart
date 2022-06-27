import 'package:flutter/material.dart';
import '../colors.dart';
import '../home/home_tabs_screen.dart';
import './reg_tiles_data.dart';
import './reg_forms_item.dart';

class RegFormsScreen extends StatefulWidget {
  static const routeName = '/regFormsScrn';

  @override
  State<RegFormsScreen> createState() => _RegFormsScreenState();
}

class _RegFormsScreenState extends State<RegFormsScreen> {
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
                'OFT Reg.',
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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    MyColors.backgroundColor1,
                    MyColors.backgroundColor2,
                    MyColors.backgroundColor3,
                  ]),
            ),
            padding: EdgeInsets.only(
              top: 130,
              left: 10,
              right: 10,
            ),
            child: GridView(
              padding: const EdgeInsets.only(
                top: 1,
                bottom: 20,
              ),
              children: REGBANKTILES
                  .map(
                    (tileData) => RegFormsItem(
                      tileData.id,
                      tileData.title,
                      tileData.subTitle,
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
          Container(
            color: Colors.amber.shade400,
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.only(top: 15, left: 20),
            child: Text(
              'Online Funds Transfer (OFT) Bank Registration',
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            //color: Colors.amber.shade400,
            width: double.infinity,
            //height: 40,
            padding: EdgeInsets.only(top: 75, left: 20),
            child: Text(
              'او ایف ٹی بینک رجسٹریشن',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Urdu',
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

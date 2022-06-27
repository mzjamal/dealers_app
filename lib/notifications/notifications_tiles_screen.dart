import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../home/home_tabs_screen.dart';
import './notification_tiles_item.dart';
import '../colors.dart';
import '../globals.dart';

class NotificationTilesScreen extends StatefulWidget {
  static const routeName = '/showNotif';
  @override
  _NotificationTilesScreenState createState() =>
      _NotificationTilesScreenState();
}

class _NotificationTilesScreenState extends State<NotificationTilesScreen> {
  var _isInit = true;
  List<NotificationTilesItem> notifItems = [];
  final String url =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDANOTIFTILES_SRV/ZSDANotifTiles?sap-client=500&\$filter=CUSTCODE eq \'' +
          Globals.dealerCode +
          '\'&\$format=json';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //print('Inside didChangeDependencies');
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<List<NotificationTilesItem>> _getJsonData() async {
    final username = Globals.serviceUserName;
    final password = Globals.servicePass;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };

    try {
      var response = await http.get(url, headers: headers);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        //if (element['CUSTCODE'] == Globals.dealerCode) {
        NotificationTilesItem notifItem = NotificationTilesItem(
          element['TILECODE'],
          element['TILETITLE'],
          element['SUBTITLE'],
          element['NOTIFCOUNT'],
        );
        notifItems.add(notifItem);
        //}
      });
    } catch (error) {
      Fluttertoast.showToast(
          msg: error,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.teal.shade600,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return notifItems;
  }

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
                'Notifications',
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
            // Container(
            //   padding: EdgeInsets.only(
            //     top: 40,
            //     left: 15,
            //     right: 15,
            //   ),
            //   child: GridView(
            //     padding: const EdgeInsets.only(
            //       top: 10,
            //       //bottom: 20,
            //     ),
            //     children: notificationTiles
            //         .map(
            //           (tileData) => NotificationTilesItem(
            //             tileData.id,
            //             tileData.title,
            //             tileData.subTitle,
            //             tileData.notification,
            //             tileData.tileColor,
            //           ),
            //         )
            //         .toList(),
            //     //Sliver are scrollable areas on screen in Flutter
            //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //       maxCrossAxisExtent: 300,
            //       childAspectRatio: 4 / 3,
            //       crossAxisSpacing: 15,
            //       mainAxisSpacing: 15,
            //     ),
            //   ),
            // ),
            Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //       begin: Alignment.topRight,
              //       end: Alignment.bottomLeft,
              //       colors: [
              //         MyColors.backgroundColor1,
              //         MyColors.backgroundColor2,
              //         MyColors.backgroundColor3,
              //       ]),
              // ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 10,
                  right: 10,
                ),
                child: Center(
                  child: FutureBuilder(
                    future: _getJsonData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          height: 500,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: CircularProgressIndicator(
                                    //backgroundColor: Colors.black,
                                    ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Please wait...'),
                            ],
                          ),
                        );
                      } else {
                        return GridView(
                            //padding: const EdgeInsets.all(8),
                            children: notifItems,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              childAspectRatio: 2.5 / 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ));
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

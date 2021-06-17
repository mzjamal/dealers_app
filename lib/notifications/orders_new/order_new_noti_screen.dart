import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './order_new_noti_item.dart';
import '../notifications_tiles_screen.dart';
import '../../globals.dart';
import '../../colors.dart';

class OrdersNewNotifScreen extends StatefulWidget {
  static const routeName = '/ordNew';
  @override
  _OrdersNewNotifScreenState createState() => _OrdersNewNotifScreenState();
}

class _OrdersNewNotifScreenState extends State<OrdersNewNotifScreen> {
  var _isInit = true;
  List<OrdersNewNotificationItem> newOrdItems = [];
  List<String> ordItemsToSave = [];
  NumberFormat format = NumberFormat('#,###,###');
  DateFormat formatter = DateFormat();
  String todayDate = '';
  String prevDate = '';
  final String url =
      'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZSDAORDNOTNEW_SRV/ZSDAOrdNotNew?sap-client=200&\$format=json';
  var postURL =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDA_SERVICES_SRV/ZSDA_NOTIFICATIONSSet';

  @override
  void initState() {
    //print('Inside initstate method.');
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

  String _todayDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm a').format(now);
    String formattedDate = formatter.format(now);
    return formattedDate + ' ' + formattedTime;
  }

  // String _prevDate() {
  //   var now = new DateTime.now();
  //   var formatter = new DateFormat('dd-MM-yyyy');
  //   String formattedTime = DateFormat('kk:mm a').format(now);
  //   String formattedDate = formatter.format(now.add(Duration(days: -1)));
  //   return formattedDate + ' ' + formattedTime;
  // }

  Future<List<OrdersNewNotificationItem>> _getJsonData() async {
    final username = Globals.serviceUserNameDev;
    final password = Globals.servicePassDev;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };

    var now = new DateTime.now();
    //prevDate = formatter.format(now.add(Duration(days: -1)));
    todayDate = formatter.format(now);

    try {
      var response = await http.get(url, headers: headers);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;
      //print(jsonData.toString());
      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        if (element['DEALER'] == Globals.dealerCode) {
          if (element['RECTYP'] == 'NEW') {
            OrdersNewNotificationItem newOrdItem = OrdersNewNotificationItem(
              rowID: element['ROWID'],
              dealer: element['DEALER'],
              orderNumber: element['ORDERNO'],
              orderDate: element['ORDDATE1'],
              orderQty: element['QTY'],
              whPlant: element['WAREH'],
              whPlantName: element['NAME'],
              prod: element['PROD'],
              readDate: _todayDate(),
              recType: element['RECTYP'],
            );
            //print('hello');
            newOrdItems.add(newOrdItem);

            //updating list of new order items to save
            Map<String, String> saveOrdItem = {
              'Dealer': element['DEALER'],
              'Docnumb': element['ORDERNO'],
              'Doctype': 'ON',
              'Readdate': _todayDate()
            };
            var jsonBody = json.encode(saveOrdItem);
            ordItemsToSave.add(jsonBody);
          } // if rec type == NEW
          else {
            // if rec type != NEW
            OrdersNewNotificationItem newOrdItem = OrdersNewNotificationItem(
              rowID: element['ROWID'],
              dealer: element['DEALER'],
              orderNumber: element['ORDERNO'],
              orderDate: element['ORDDATE1'],
              orderQty: element['QTY'],
              whPlant: element['WAREH'],
              whPlantName: element['NAME'],
              prod: element['PROD'],
              readDate: element['READDATE'],
              recType: element['RECTYP'],
            );

            newOrdItems.add(newOrdItem);
          }
        } // End Dealer IF Statement
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
    //before return, lets save new notification to table
    await _saveOrdersNotifications();
    //await _setNotificationsData();
    return newOrdItems;
  }

  Future<void> _saveOrdersNotifications() async {
    final username = Globals.serviceUserName;
    final password = Globals.servicePass;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    Map<String, String> newHeaders1 = {
      'Accept': "application/json",
      'Content-Type': "application/json",
      'X-Requested-With': 'X',
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };

    ordItemsToSave.forEach((element) async {
      //print(element);
      var feedback = await http.post(
        postURL,
        headers: newHeaders1,
        body: element,
      );
      int statusCode = feedback.statusCode;
      if (statusCode == 201) {
        //print('Success');
      } else {
        //print('Feedback : ' + feedback.body);
      }
    });
  }

  // Future<void> _setNotificationsData() async {
  //   final username = Globals.serviceUserNameDev;
  //   final password = Globals.servicePassDev;
  //   final credentials = '$username:$password';
  //   final stringToBase64 = utf8.fuse(base64);
  //   final encodedCredentials = stringToBase64.encode(credentials);

  //   Map<String, String> headers = {
  //     HttpHeaders.contentTypeHeader: "application/json",
  //     HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
  //   };

  //   try {
  //     var urlNoti =
  //         'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZSDATOTNOT_SRV/ZSDATotNot?sap-client=200&\$format=json';
  //     var response = await http.get(urlNoti, headers: headers);

  //     var jsonData = json.decode(response.body) as Map<String, dynamic>;

  //     var vdata = jsonData['d'];
  //     var xdata = vdata['results'] as List;

  //     xdata.forEach((element) {
  //       if (element['CUSTCODE'] == Globals.dealerCode) {
  //         if (element['NOTTYP'] == 'IN') {
  //           Globals.newInvoiceNotifications = int.parse(element['NCOUNT']);
  //           Globals.overAllNotifications =
  //               Globals.overAllNotifications + int.parse(element['NCOUNT']);
  //         }
  //         if (element['NOTTYP'] == 'ON') {
  //           Globals.newOrderNotifications = int.parse(element['NCOUNT']);
  //           Globals.overAllNotifications =
  //               Globals.overAllNotifications + int.parse(element['NCOUNT']);
  //         }
  //       }
  //     });
  //   } catch (error) {
  //     Fluttertoast.showToast(
  //         msg: error,
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.teal.shade600,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }

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
                  'Orders Notification',
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
                  .pushReplacementNamed(NotificationTilesScreen.routeName);
            },
          ),
        ],
      ),
      body: InteractiveViewer(
        child: Container(
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
            children: [
              Container(
                color: Colors.amber.shade400,
                width: MediaQuery.of(context).size.width,
                height: 45,
                padding: EdgeInsets.only(
                  top: 5,
                  //left: 10,
                ),
                child: Text(
                  'آرڈرکی اطلاع',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListView(
                  children: [
                    FutureBuilder(
                      future: _getJsonData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            height: 500,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black,
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ...newOrdItems,
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

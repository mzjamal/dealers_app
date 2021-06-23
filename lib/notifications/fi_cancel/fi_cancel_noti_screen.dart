import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './fi_cancel_noti_item.dart';
import '../../globals.dart';
import '../notifications_tiles_screen.dart';
import '../../colors.dart';

class FiCancelNotificationScreen extends StatefulWidget {
  static const routeName = '/fiCan';
  @override
  _FiCancelNotificationScreenState createState() =>
      _FiCancelNotificationScreenState();
}

class _FiCancelNotificationScreenState
    extends State<FiCancelNotificationScreen> {
  var _isInit = true;
  List<FiCancelNotificatioItem> cancelFiItems = [];
  List<String> canFiItemsToSave = [];
  NumberFormat format = NumberFormat('#,###,###');
  DateFormat formatter = DateFormat();
  String todayDate = '';
  String prevDate = '';
  final String url =
      'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZSDAFINOTCAN2_SRV/ZSDAFiNotCan2?sap-client=200&\$format=json';
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

  String _thousandSeprator(dynamic value) {
    var intValue = int.parse(value);
    var returnValue = format.format(intValue);
    return returnValue;
  }

  // String _thousandSeprator2(int newValue) {
  //   var returnValue1 = format.format(newValue);
  //   return returnValue1;
  // }

  String _dateFormatter(String inDate) {
    var vDay = inDate.substring(0, 2);
    var vMonth = inDate.substring(2, 4);
    var vYear = inDate.substring(4, 8);
    return vDay + '-' + vMonth + '-' + vYear;
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

  Future<List<FiCancelNotificatioItem>> _getJsonData() async {
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
    prevDate = formatter.format(now.add(Duration(days: -1)));
    todayDate = formatter.format(now);

    try {
      var response = await http.get(url, headers: headers);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;
      //print(jsonData.toString());
      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        if (element['CUST'] == Globals.dealerCode) {
          if (element['RECTYP'] == 'NEW') {
            FiCancelNotificatioItem newFiItem = FiCancelNotificatioItem(
              rowID: element['ROWID'],
              dealer: element['CUST'],
              fiNumber: element['FINO'],
              sysFiNumber: element['SFINO'],
              fiStatus: element['FIINST_STATUS'],
              fiType: element['FIINST_TYPE'],
              bankDocDate: _dateFormatter(element['EX_DOC_DATE']),
              fiDate: _dateFormatter(element['SFIDATE']),
              bank: element['BANK'],
              docAmt: _thousandSeprator(element['DOC_AMT']
                  .toString()
                  .substring(0, element['DOC_AMT'].toString().indexOf('.'))),
              readDate: _todayDate(),
              recType: element['RECTYP'],
            );
            //print('hello');
            cancelFiItems.add(newFiItem);

            //updating list of new invoice items to save
            Map<String, String> saveFiItem = {
              'Dealer': element['CUST'],
              'Docnumb': element['SFINO'],
              'Doctype': 'FC',
              'Readdate': _todayDate()
            };
            var jsonBody = json.encode(saveFiItem);
            canFiItemsToSave.add(jsonBody);
          } else {
            // if rec type != NEW
            FiCancelNotificatioItem newFiItem = FiCancelNotificatioItem(
              rowID: element['ROWID'],
              dealer: element['CUST'],
              fiNumber: element['FINO'],
              sysFiNumber: element['SFINO'],
              fiStatus: element['FIINST_STATUS'],
              fiType: element['FIINST_TYPE'],
              bankDocDate: _dateFormatter(element['EX_DOC_DATE']),
              fiDate: _dateFormatter(element['SFIDATE']),
              bank: element['BANK'],
              docAmt: _thousandSeprator(element['DOC_AMT']
                  .toString()
                  .substring(0, element['DOC_AMT'].toString().indexOf('.'))),
              readDate: element['READDATE'],
              recType: element['RECTYP'],
            );
            //print('hello');
            cancelFiItems.add(newFiItem);
          }
        }
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
    _saveCanceledFiNotifications();
    return cancelFiItems;
  }

  Future<void> _saveCanceledFiNotifications() async {
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

    canFiItemsToSave.forEach((element) async {
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
                'Cancelled FI Notif',
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
                  'ایف آئی کی منسوخی کی اطلاع',
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
                          if (cancelFiItems.isEmpty) {
                            return Container(
                              height: 500,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  'منسوخ شدہ بینک دستاویزات کے بارے میں فی الحال کوئی اطلاع نہیں ہے۔',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontFamily: 'Urdu',
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  ...cancelFiItems,
                                ],
                              ),
                            );
                          }
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

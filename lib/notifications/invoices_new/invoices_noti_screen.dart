import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './invoices_noti_item.dart';
import '../notifications_tiles_screen.dart';
import '../../globals.dart';
import '../../colors.dart';

class InvoicesNotificationScreen extends StatefulWidget {
  static const routeName = '/invNoti';
  @override
  _InvoicesNotificationScreenState createState() =>
      _InvoicesNotificationScreenState();
}

class _InvoicesNotificationScreenState
    extends State<InvoicesNotificationScreen> {
  var _isInit = true;
  List<InvoicesNotificationItem> invoiceItems = [];
  List<String> invItemsToSave = [];
  NumberFormat formatDTP = NumberFormat('#,###,###');
  DateFormat formatter = DateFormat();
  String todayDate = '';
  String prevDate = '';
  final String url =
      'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZSDAINVNOTNEW_SRV/ZSDAInvNotNew?sap-client=200&\$format=json';
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

  String _dateFormatter(String inDate) {
    var vDay = inDate.substring(0, 2);
    var vMonth = inDate.substring(2, 4);
    var vYear = inDate.substring(4, 8);
    return vDay + '-' + vMonth + '-' + vYear;
  }

  Future<List<InvoicesNotificationItem>> _getJsonData() async {
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
        if (element['DEALER'] == Globals.dealerCode) {
          if (element['RECTYP'] == 'NEW') {
            InvoicesNotificationItem invItem = InvoicesNotificationItem(
              rowID: element['ROWID'],
              dealer: element['DEALER'],
              invNumber: element['INVNO'],
              billingDate: _dateFormatter(element['BILLDATE']),
              invQty: element['QTY'],
              whPlant: element['WAREH'],
              whPlantName: element['NAME'],
              prod: element['PROD'],
              readDate: _todayDate(),
              recType: element['RECTYP'],
            );
            //print('hello');
            invoiceItems.add(invItem);

            //updating list of new invoice items to save
            Map<String, String> saveInvItem = {
              'Dealer': element['DEALER'],
              'Docnumb': element['INVNO'],
              'Doctype': 'IN',
              'Readdate': _todayDate()
            };
            var jsonBody = json.encode(saveInvItem);
            invItemsToSave.add(jsonBody);
          } else {
            // if rec type != NEW
            InvoicesNotificationItem invItem = InvoicesNotificationItem(
              rowID: element['ROWID'],
              dealer: element['DEALER'],
              invNumber: element['INVNO'],
              billingDate: _dateFormatter(element['BILLDATE']),
              invQty: element['QTY'],
              whPlant: element['WAREH'],
              whPlantName: element['NAME'],
              prod: element['PROD'],
              readDate: element['READDATE'],
              recType: element['RECTYP'],
            );

            invoiceItems.add(invItem);
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
    //before return, lets save new notification to table
    await _saveNewInvoiceNotifications();
    return invoiceItems;
  }

  Future<void> _saveNewInvoiceNotifications() async {
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

    invItemsToSave.forEach((element) async {
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
                'Inv Notifications',
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
                  'انوائس کی اطلاع',
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
                                ...invoiceItems,
                                // Padding(
                                //   padding:
                                //       const EdgeInsets.only(left: 10, top: 10),
                                //   child: Container(
                                //     alignment: Alignment.topLeft,
                                //     child: Text(
                                //       'Note: Price is in PKR/bag.',
                                //       style: TextStyle(
                                //           fontSize: 18,
                                //           fontWeight: FontWeight.w600),
                                //     ),
                                //   ),
                                // ),
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

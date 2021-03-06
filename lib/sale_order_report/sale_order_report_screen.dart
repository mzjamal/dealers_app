import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import './sale_order_item.dart';
import '../globals.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class SaleOrderReportScreen extends StatefulWidget {
  static const routeName = '/orderRep';
  @override
  _SaleOrderReportScreenState createState() => _SaleOrderReportScreenState();
}

class _SaleOrderReportScreenState extends State<SaleOrderReportScreen> {
  var _isInit = true;
  List<SaleOrderItem> orderItems = [];
  String _totalOrders = '';
  int _totalOrd = 0;
  NumberFormat formatDTP = NumberFormat('#,###,###');
  final _urlReport =
      'https://ffcportal.ffc.com.pk:8881/opendocumentnew/ordersreport.jsp?dealer=' +
          Globals.dealerCode +
          Globals.deviceUUID;
  final String url =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDAORDERSS_SRV/ZSDAOrderss?sap-client=500&\$filter=DEALER eq \'' +
          Globals.dealerCode +
          '\'&\$format=json';

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

  String _dateFormatter(String inDate) {
    var vDay = inDate.substring(0, 2);
    var vMonth = inDate.substring(2, 4);
    var vYear = inDate.substring(6, 8);
    return vDay + '-' + vMonth + '-' + vYear;
  }

  Future<List<SaleOrderItem>> _getJsonData() async {
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
        //if (element['DEALER'] == Globals.dealerCode) {
        SaleOrderItem orderItem = SaleOrderItem(
          orderNo: element['ORDERNO'],
          orderDate: _dateFormatter(element['CDATE']),
          qty: element['QTY'],
          product: element['PROD'],
          plant: element['NAME'],
          isShipped: element['DELIVERED'],
        );

        _totalOrd = _totalOrd + 1;

        // _totalOrders = element['ROWID'];

        orderItems.add(orderItem);
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
    //print('orders = ' + _totalOrders);
    _totalOrders = _totalOrd.toString();
    return orderItems;
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
                'Orders Report',
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
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                ),
                width: double.infinity,
                child: Text(
                  '?????????? ???????????? ???? ?????? ?????? ???? ?????? ????????',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 50,
                  right: 10,
                ),
                width: double.infinity,
                child: Text(
                  ' ??????: ???????? ?????? ?????? ?????? ??????????????????  ???????????? ?????????? ??????',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 90, right: 8, left: 8, bottom: 8),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Container(
                    color: Colors.amber.shade400,
                    child: TextButton.icon(
                      onPressed: () {
                        launch(_urlReport);
                        // Fluttertoast.showToast(
                        //     msg: "Under Development...",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.CENTER,
                        //     timeInSecForIosWeb: 1,
                        //     backgroundColor: Colors.teal.shade800,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0);
                      },
                      icon: const Icon(
                        Icons.view_comfortable_rounded,
                        color: Colors.teal,
                        size: 26,
                      ),
                      label: const Text(
                        'View Sales Orders Report',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      //color: Colors.orangeAccent,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 125),
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
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                  ),
                                  width: double.infinity,
                                  child: Text(
                                    'Total Orders: ' + _totalOrders,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                ...orderItems,

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

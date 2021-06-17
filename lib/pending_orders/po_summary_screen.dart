import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import './po_item.dart';
import '../globals.dart';
import '../colors.dart';

class PendingOrderSummaryScreen extends StatefulWidget {
  static const routeName = '/poSummaryScreen';
  @override
  _PendingOrderSummaryScreenState createState() =>
      _PendingOrderSummaryScreenState();
}

class _PendingOrderSummaryScreenState extends State<PendingOrderSummaryScreen> {
  var _isInit = true;
  List<PendingOrderItem> poItems = [];
  DateFormat formatter = DateFormat();
  NumberFormat formatBg = NumberFormat('#,###,###,###.###');
  //NumberFormat formatOrders = NumberFormat('#,###,###.0##', 'en_US');
  num _totalPendingOrders = 0;
  //String todayDate = '';
  final String url =
      'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZSDAPOSUMM_SRV/ZSDAPOSumm?sap-client=200&\$format=json';
  // final String url =
  //     'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZPO_SRV/ZPOSum?sap-client=500&\$format=json';

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
    var returnValue = formatBg.parse(value);
    return returnValue.toString();
  }

  String _thousandSepratorForTotal(dynamic value) {
    var returnValue = formatBg.parse(value);
    _totalPendingOrders = _totalPendingOrders + returnValue;
    return returnValue.toString();
  }

  String _thousandSepratorSimp(num value) {
    var returnValue = formatBg.parse(value.toString());
    return returnValue.toString();
  }

  Future<List<PendingOrderItem>> _getJsonData() async {
    final username = Globals.serviceUserNameDev;
    final password = Globals.servicePassDev;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };

    try {
      var response = await http.get(url, headers: headers);
      //print(response.statusCode);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        //if (element['SALES_GROUP'] == Globals.globalSalesDist && element['CUSTOMER'] == Globals.dealerCode) {
        if (element['KUNNR'] == Globals.dealerCode) {
          PendingOrderItem poItem = PendingOrderItem(
            prodSrl: element['SRL'],
            prodName: element['PROD'],
            pendingPlant: _thousandSeprator(element['PEND_PLANT']),
            pendingWh: _thousandSeprator(element['PEND_WH']),
            pendingTotal: _thousandSepratorForTotal(element['TOTAL']),
          );

          poItems.add(poItem);
        }
      });
    } catch (error) {
      //print(error);
    }

    //sorting the list on srl number
    poItems.sort((a, b) => a.prodSrl.compareTo(b.prodSrl));
    return poItems;
  }

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
                width: 10,
              ),
              Expanded(
                child: Text(
                  'Pending Orders',
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 150,
                padding: EdgeInsets.only(
                  bottom: 60,
                ),
                alignment: Alignment.topCenter,
                child: Text(
                  'تفصیل دیکھنے کیلئے کسی پروڈکٹ پر ٹیپ کریں',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 5,
                right: 5,
                bottom: 8,
              ),
              child: Container(
                height: 35,
                //decoration: BoxDecoration(color: Colors.grey),
                color: Colors.amber.shade400,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            'Products',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            'Plant/Port',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.22,
                          child: Text(
                            'Warehouse',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.22,
                          child: Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75),
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 1.0, right: 1.0),
                          child: Column(
                            children: <Widget>[
                              ...poItems,
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  padding: EdgeInsets.only(
                                    bottom: 50,
                                  ),
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'Total (MT):   ' +
                                        _thousandSepratorSimp(
                                            _totalPendingOrders),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
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
    );
  }
}

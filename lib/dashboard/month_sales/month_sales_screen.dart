import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './month_sales_item.dart';
import '../../home/home_tabs_screen.dart';
import '../../globals.dart';

class MonthSalesScreen extends StatefulWidget {
  static const routeName = '/monthSaleScreen';
  @override
  _MonthSalesScreenState createState() => _MonthSalesScreenState();
}

class _MonthSalesScreenState extends State<MonthSalesScreen> {
  var _isInit = true;
  String dCode;
  // DateFormat formatter = DateFormat();
  List<MonthSalesItem> dealerSaleItems = [];
  var _now = new DateTime.now();
  NumberFormat formatSale = NumberFormat('#,###,###.0##', 'en_US');
  NumberFormat formatGrossSale = NumberFormat('#,###,###');
  String dealerCode;
  String dealerName;
  String address;
  String contactNo;
  String proprietorName;
  String setUpDate;
  String salePointCode;
  String salePointDesc;
  double _totalMonthSale = 0;
  double _totalYearSale = 0;
  //int _currentMonth;

  //to handle cust output on screen with no sales
  //if there is no sale for a dealer, this flag will be set to true
  var _zeroSale = false;

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

  String _thousandSepratorMSale(dynamic value) {
    var returnValue = formatSale.parse(value.toString());
    _totalMonthSale = _totalMonthSale + returnValue;
    return returnValue.toString();
  }

  String returnMonth(DateTime date) {
    return new DateFormat.MMMM().format(date);
  }

  String returnYear(DateTime date) {
    return new DateFormat.y().format(date);
  }

  String _thousandSepratorYSale(dynamic value) {
    var returnValue = formatSale.parse(value.toString());
    _totalYearSale = _totalYearSale + returnValue;
    return returnValue.toString();
  }

  String _thousandSeprator(double value) {
    //var intValue = int.parse(value);
    var returnValue = formatGrossSale.format(value);
    return returnValue;
  }

  Future<List<MonthSalesItem>> _getJsonData() async {
    final username = Globals.serviceUserName;
    final password = Globals.servicePass;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    final String url =
        'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZDSALE_NSRV/ZDealerSale(\'' +
            Globals.dealerCode +
            '\')?sap-client=500&\$format=json';

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };

    try {
      var response = await http.get(url, headers: headers);
      //print(response.statusCode);

      if (response.statusCode == 200) {
        _zeroSale = false;
        var jsonData = json.decode(response.body) as Map<String, dynamic>;

        var vdata = jsonData['d'];
        //var xdata = vdata['id'] as List;
        MonthSalesItem dealerSaleItem = MonthSalesItem(
          dealerCode: vdata['DEALER'],
          sonaPmsale: _thousandSepratorMSale(vdata['SONAPMSALE']),
          sonaPysale: _thousandSepratorYSale(vdata['SONAPYSALE']),
          sonaGmsale: _thousandSepratorMSale(vdata['SONAGMSALE']),
          sonaGysale: _thousandSepratorYSale(vdata['SONAGYSALE']),
          sonaDapmsale: _thousandSepratorMSale(vdata['SONADAPMSALE']),
          sonaDapysale: _thousandSepratorYSale(vdata['SONADAPYSALE']),
          ffcDapmsale: _thousandSepratorMSale(vdata['FFCDAPMSALE']),
          ffcDapysale: _thousandSepratorYSale(vdata['FFCDAPYSALE']),
          sopMsale: _thousandSepratorMSale(vdata['SOPMSALE']),
          sopYsale: _thousandSepratorYSale(vdata['SOPYSALE']),
          mopMsale: _thousandSepratorMSale(vdata['MOPMSALE']),
          mopYsale: _thousandSepratorYSale(vdata['MOPYSALE']),
          zincMsale: _thousandSepratorMSale(vdata['ZINCMSALE']),
          zincYsale: _thousandSepratorYSale(vdata['ZINCYSALE']),
          boronMsale: _thousandSepratorMSale(vdata['BORONMSALE']),
          boronYsale: _thousandSepratorYSale(vdata['BORONYSALE']),
        );

        dealerSaleItems.add(dealerSaleItem);
      } else {
        MonthSalesItem dealerSaleItem = MonthSalesItem(
          dealerCode: 'No sale available',
          sonaPmsale: '0',
          sonaPysale: '0',
          sonaGmsale: '0',
          sonaGysale: '0',
          sonaDapmsale: '0',
          sonaDapysale: '0',
          ffcDapmsale: '0',
          ffcDapysale: '0',
          sopMsale: '0',
          sopYsale: '0',
          mopMsale: '0',
          mopYsale: '0',
          zincMsale: '0',
          zincYsale: '0',
          boronMsale: '0',
          boronYsale: '0',
        );
        _zeroSale = true;
        dealerSaleItems.add(dealerSaleItem);
      }
    } catch (error) {
      //print(error);
    }

    // var now = new DateTime.now();
    // var currentMonth = now.month;
    // _currentMonth = currentMonth - 1;
    // print('Current Mont: ' + _currentMonth.toString());
    return dealerSaleItems;
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
                'Sales ' + returnMonth(_now) + ' ' + returnYear(_now),
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
      // drawer: Drawer(
      //   child: MainDrawer(),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade100,
              Colors.green.shade100,
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 5,
                    ),
                    height: 30,
                    color: Colors.amber.shade400,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 15,
                            //top: 10,
                          ),
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const Text(
                            'Product',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Text(
                            returnMonth(_now) + ' Sales',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Container(
                        //   alignment: Alignment.center,
                        //   height: 30,
                        //   width: MediaQuery.of(context).size.width * 0.3,
                        //   child: const Text(
                        //     'Sales 2021',
                        //     style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
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
                            top: 5,
                          ),
                          child: Column(
                            children: <Widget>[
                              ...dealerSaleItems,
                              // SizedBox(
                              //   height: 5,
                              // ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                      top: 10,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    height: 30,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: const Text(
                                      'Total Sales',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: _zeroSale
                                        ? Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.right,
                                          )
                                        : Text(
                                            _thousandSeprator(_totalMonthSale),
                                            // _totalMonthSale
                                            //     .toString()
                                            //     .substring(
                                            //         0,
                                            //         _totalMonthSale
                                            //             .toString()
                                            //             .indexOf('.')),
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: true,
                                          ),
                                  ),
                                  // SizedBox(
                                  //   height: 20,
                                  //   width: 25,
                                  // ),
                                  // Container(
                                  //   width: MediaQuery.of(context).size.width *
                                  //       0.22,
                                  //   padding: EdgeInsets.only(
                                  //     right: 20,
                                  //     top: 10,
                                  //   ),
                                  //   child: _zeroSale
                                  //       ? Text(
                                  //           '0',
                                  //           style: TextStyle(
                                  //               fontSize: 24,
                                  //               fontWeight: FontWeight.bold),
                                  //           textAlign: TextAlign.right,
                                  //         )
                                  //       : Text(
                                  //           _thousandSeprator(_totalYearSale),
                                  //           // _totalYearSale.toString().substring(
                                  //           //     0,
                                  //           //     _totalYearSale
                                  //           //         .toString()
                                  //           //         .indexOf('.')),
                                  //           textAlign: TextAlign.right,
                                  //           style: TextStyle(
                                  //               fontSize: 24,
                                  //               fontWeight: FontWeight.bold),
                                  //           overflow: TextOverflow.ellipsis,
                                  //           maxLines: 1,
                                  //           softWrap: true,
                                  //         ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'نوٹ',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Urdu'),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'مقدار میٹرک ٹن میں ہے اور سیلز مہینے کے آج کے دن تک ہے',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Urdu',
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

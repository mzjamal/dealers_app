import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './prev_year_sale_item.dart';
import '../../home/home_tabs_screen.dart';
import '../../globals.dart';

class PreviousYearSaleScreen extends StatefulWidget {
  static const routeName = '/prevYearSale';
  @override
  _PreviousYearSaleScreenState createState() => _PreviousYearSaleScreenState();
}

class _PreviousYearSaleScreenState extends State<PreviousYearSaleScreen> {
  var _isInit = true;
  String dCode;
  var _now = new DateTime.now();
  List<PreviousYearSaleItem> dealerSaleItems = [];
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
  //double _totalMonthSale = 0;
  double _totalYearSale = 0;
  double _totalYearSaleToDate = 0;

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

  // String _thousandSepratorMSale(dynamic value) {
  //   var returnValue = formatSale.parse(value.toString());
  //   _totalMonthSale = _totalMonthSale + returnValue;
  //   return returnValue.toString();
  // }

  String _thousandSepratorYSale(dynamic value) {
    var returnValue = formatSale.parse(value.toString());
    _totalYearSale = _totalYearSale + returnValue;
    return returnValue.toString();
  }

  String _thousandSepratorYSaleDate(dynamic value) {
    var returnValue = formatSale.parse(value.toString());
    _totalYearSaleToDate = _totalYearSaleToDate + returnValue;
    return returnValue.toString();
  }

  String _thousandSeprator(double value) {
    //var intValue = int.parse(value);
    var returnValue = formatGrossSale.format(value);
    return returnValue;
  }

  String _returnYear(DateTime date) {
    return new DateFormat.y().format(date.subtract(Duration(days: 365)));
  }

  Future<List<PreviousYearSaleItem>> _getJsonData() async {
    final username = Globals.serviceUserName;
    final password = Globals.servicePass;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    final String url =
        'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDASALEPREVYRNEW_SRV/ZSDASalePrevYrNew(\'' +
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
        PreviousYearSaleItem dealerSaleItem = PreviousYearSaleItem(
          dealerCode: vdata['DEALER'],
          sonaPysale: _thousandSepratorYSale(vdata['SONAPYSALE']),
          sonaGysale: _thousandSepratorYSale(vdata['SONAGYSALE']),
          sonaDapysale: _thousandSepratorYSale(vdata['SONADAPYSALE']),
          ffcDapysale: _thousandSepratorYSale(vdata['FFCDAPYSALE']),
          sopYsale: _thousandSepratorYSale(vdata['SOPYSALE']),
          mopYsale: _thousandSepratorYSale(vdata['MOPYSALE']),
          zincYsale: _thousandSepratorYSale(vdata['ZINCYSALE']),
          boronYsale: _thousandSepratorYSale(vdata['BORONYSALE']),
          sonaPysaleDate: _thousandSepratorYSaleDate(vdata['SONAPYSALETODAT']),
          sonaGysaleDate: _thousandSepratorYSaleDate(vdata['SONAGYSALETODAT']),
          sonaDapysaleDate:
              _thousandSepratorYSaleDate(vdata['SONADAPYSALETODAT']),
          ffcDapysaleDate:
              _thousandSepratorYSaleDate(vdata['FFCDAPYSALETODAT']),
          sopYsaleDate: _thousandSepratorYSaleDate(vdata['SOPYSALETODAT']),
          mopYsaleDate: _thousandSepratorYSaleDate(vdata['MOPYSALETODAT']),
          zincYsaleDate: _thousandSepratorYSaleDate(vdata['ZINCYSALETODAT']),
          boronYsaleDate: _thousandSepratorYSaleDate(vdata['BORONYSALETODAT']),
        );

        dealerSaleItems.add(dealerSaleItem);
      } else {
        PreviousYearSaleItem dealerSaleItem = PreviousYearSaleItem(
          dealerCode: 'No sale available',
          sonaPysale: '0',
          sonaGysale: '0',
          sonaDapysale: '0',
          ffcDapysale: '0',
          sopYsale: '0',
          mopYsale: '0',
          zincYsale: '0',
          boronYsale: '0',
          sonaPysaleDate: '0',
          sonaGysaleDate: '0',
          sonaDapysaleDate: '0',
          ffcDapysaleDate: '0',
          sopYsaleDate: '0',
          mopYsaleDate: '0',
          zincYsaleDate: '0',
          boronYsaleDate: '0',
        );
        _zeroSale = true;
        dealerSaleItems.add(dealerSaleItem);
      }
    } catch (error) {
      //print(error);
    }
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
                'Sales Year ' + _returnYear(_now),
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
                // SizedBox(
                //   height: 5,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 5,
                    ),
                    height: 45,
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
                          height: 40,
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
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            'Year to Date',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.22,
                          child: Text(
                            'Year ' + _returnYear(_now),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                                        0.19,
                                    child: _zeroSale
                                        ? Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.right,
                                          )
                                        : Text(
                                            _thousandSeprator(
                                                _totalYearSaleToDate),
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: true,
                                          ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 25,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.24,
                                    padding: EdgeInsets.only(
                                      right: 15,
                                      top: 10,
                                    ),
                                    child: _zeroSale
                                        ? Text(
                                            '0',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.right,
                                          )
                                        : Text(
                                            _thousandSeprator(_totalYearSale),
                                            // _totalYearSale.toString().substring(
                                            //     0,
                                            //     _totalYearSale
                                            //         .toString()
                                            //         .indexOf('.')),
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                            // overflow: TextOverflow.ellipsis,
                                            // maxLines: 1,
                                            // softWrap: true,
                                          ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              // Container(
                              //   padding: EdgeInsets.only(
                              //     left: 10,
                              //   ),
                              //   alignment: Alignment.center,
                              //   child: Text(
                              //     '??????',
                              //     style: TextStyle(
                              //         fontSize: 24,
                              //         color: Colors.blue.shade800,
                              //         fontWeight: FontWeight.bold,
                              //         fontFamily: 'Urdu'),
                              //   ),
                              // ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '?????? : ?????????? ?????????? ???? ?????? ????',
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

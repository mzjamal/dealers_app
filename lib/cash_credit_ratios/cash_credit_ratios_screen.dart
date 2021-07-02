import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import './cash_credit_ratio_item.dart';
import '../colors.dart';
import '../globals.dart';

class CashCreditRatiosScreen extends StatefulWidget {
  static const routeName = '/cashCrdRatio';
  @override
  _CashCreditRatiosScreenState createState() => _CashCreditRatiosScreenState();
}

class _CashCreditRatiosScreenState extends State<CashCreditRatiosScreen> {
  var _isInit = true;

  NumberFormat formatSale = NumberFormat('#,###,##0.0##', 'en_US');
  List<CashCreditRatioItem> crdItems = [];
  //8855 for http and 8856 for https for PRD
  final String url =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDARATIOS_SRV/ZSDARatios(\'' +
          Globals.dealerCode +
          '\')?sap-client=500&\$format=json';
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

  // String _thousandSepratorYSaleDate(dynamic value) {
  //   var returnValue = formatSale.parse(value.toString());
  //   return returnValue.toString();
  // }

  String _thousandSeprator(String value) {
    var intValue = double.parse(value);
    var returnValue = formatSale.format(intValue);
    return returnValue;
  }

  Future<List<CashCreditRatioItem>> _getJsonData() async {
    //_firstRun = false;
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

      CashCreditRatioItem crdItem = CashCreditRatioItem(
        dealer: vdata['DEALER'],
        cashSale: _thousandSeprator(vdata['CASHSALE']),
        creditSale: _thousandSeprator(vdata['CREDITSALE']),
        cashCrdRatios: vdata['CRDRATIO'],
      );

      crdItems.add(crdItem);
    } catch (error) {
      //print(error);
    }

    return crdItems;
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
                'Cash Credit Ratios',
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
            Container(
              padding: EdgeInsets.only(
                top: 40,
                left: 15,
                right: 15,
              ),
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
                              ...crdItems,
                              // Container(
                              //   padding: EdgeInsets.only(
                              //     left: 10,
                              //   ),
                              //   alignment: Alignment.center,
                              //   child: Text(
                              //     'نوٹ : مقدار میٹرک ٹن میں ہے',
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //       fontSize: 22,
                              //       fontFamily: 'Urdu',
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
    );
  }
}

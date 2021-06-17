import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './dtp_item.dart';
import '../colors.dart';
import '../home/home_tabs_screen.dart';
import '../globals.dart';

class DealerTransferPrice extends StatefulWidget {
  static const routeName = '/dtpScreen';
  @override
  _DealerTransferPriceState createState() => _DealerTransferPriceState();
}

class _DealerTransferPriceState extends State<DealerTransferPrice> {
  var _isInit = true;
  double _taxRate;
  List<DTPItem> dtpItems = [];
  NumberFormat formatDTP = NumberFormat('#,###,###');
  final String urlTax =
      'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZSDATAX_SRV/ZSDATax(\'' +
          Globals.dealerCode +
          '\')?sap-client=200&\$format=json';
  final String url =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZDTP_SRV/ZDTP?sap-client=500&\$format=json';

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
    var vYear = inDate.substring(4, 8);
    return vDay + '-' + vMonth + '-' + vYear;
  }

  // String _thousandSeprator(dynamic value) {
  //   var intValue = int.parse(value);
  //   var returnValue = formatDTP.format(intValue);
  //   return returnValue;
  // }
  Future<double> _getTaxData() async {
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
      var response = await http.get(urlTax, headers: headers);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      _taxRate = double.parse(vdata['TAXRATE']);
      //print('Data = ' + _taxRate.toString());
    } catch (error) {
      //print(error);
    }
    if (_taxRate == null) {
      return 0.0;
    } else {
      return _taxRate;
    }
  }

  Future<List<DTPItem>> _getJsonData() async {
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
      var taxRates = await _getTaxData();
      var response = await http.get(url, headers: headers);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        if (element['SDIST'] == Globals.globalSalesDist) {
          DTPItem dtpItem = DTPItem(
            prodName: element['PROD'],
            applicalbeDate: _dateFormatter(element['FROMDATE']),
            dtp: element['DTP'],
            taxRate: taxRates,
          );

          dtpItems.add(dtpItem);
        }
      });
    } catch (error) {
      print(error);
    }

    return dtpItems;
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
                width: 5,
              ),
              Expanded(
                child: Text(
                  'Dealer Transfer Price',
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Container(
                  height: 30,
                  //decoration: BoxDecoration(color: Colors.grey),
                  color: Colors.amber,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                            ),
                            alignment: Alignment.centerLeft,
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              'Products/Rs Per Bag',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.32,
                            child: Text(
                              'Effective Date',
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
                padding: const EdgeInsets.only(top: 35),
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
                                ...dtpItems,
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'NOTE:\nPrice is in Rs per bag.',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    //top: 5,
                                    bottom: 10,
                                  ),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'These rates are for product from Plant-Road.',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
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
      ),
    );
  }
}

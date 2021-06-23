import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './account_balance_item.dart';
import '../home/home_tabs_screen.dart';
import '../globals.dart';
import '../colors.dart';

class AccountBalanceScreen extends StatefulWidget {
  static const routeName = '/accBalScrn';
  @override
  _AccountBalanceScreenState createState() => _AccountBalanceScreenState();
}

class _AccountBalanceScreenState extends State<AccountBalanceScreen> {
  //TextEditingController _textController = TextEditingController();
  // String dealerCode;
  // String dealerName;
  // String address;
  // String balance;
  var _isInit = true;
  var _firstRun = true;
  num _totalDealerBalance = 0;
  num _totalDealerBalanceFfc = 0;
  num _totalDealerBalanceFfbl = 0;
  //String todayDate = '';
  //DateFormat formatter = DateFormat();
  List<AccountBalanceItem> dealerBal = [];
  NumberFormat format = NumberFormat('#,###,###');
  //var now = new DateTime.now();
  String todayDate = DateFormat().format(new DateTime.now());
  final String url =
      'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZSDADBALANCE_SRV/ZSDADBalance?sap-client=200&\$format=json';

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

  // String _thousandSeprator(dynamic value) {
  //   var intValue = int.parse(value);
  //   var returnValue = format.format(intValue);
  //   _totalDealerBalance = _totalDealerBalance + int.parse(value);
  //   return returnValue;
  // }

  String _thousandSepratorFfc(dynamic value) {
    var intValue = int.parse(value);
    var returnValue = format.format(intValue);
    _totalDealerBalance = _totalDealerBalance + int.parse(value);
    _totalDealerBalanceFfc = _totalDealerBalanceFfc + int.parse(value);
    return returnValue;
  }

  String _thousandSepratorFfbl(dynamic value) {
    var intValue = int.parse(value);
    var returnValue = format.format(intValue);
    _totalDealerBalance = _totalDealerBalance + int.parse(value);
    _totalDealerBalanceFfbl = _totalDealerBalanceFfbl + int.parse(value);
    return returnValue;
  }

  String _thousandSeprator2(int newValue) {
    var returnValue1 = format.format(newValue);
    return returnValue1;
  }

  String _dateFormatter(String inDate) {
    var vDay = inDate.substring(0, 2);
    var vMonth = inDate.substring(2, 4);
    var vYear = inDate.substring(6, 8);
    return vDay + '-' + vMonth + '-' + vYear;
  }

  Future<List<AccountBalanceItem>> _getJsonData() async {
    _firstRun = false;
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
      //print('inside getJsonData fun');

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        if (element['CUST'] == Globals.dealerCode) {
          // FFC FI document
          if (element['FFBLIND'] == 'N') {
            AccountBalanceItem balance = AccountBalanceItem(
              dealerCode: element['CUST'],
              fiType: element['FITYPE'],
              fiNumber: element['FINO'],
              bank: element['BANK'],
              fiDate: _dateFormatter(element['FIDATE']),
              balance: _thousandSepratorFfc(element['AMT']
                  .toString()
                  .substring(0, element['AMT'].toString().indexOf('.'))),
            );
            dealerBal.add(balance);
          } else {
            //FFBL FI Document
            AccountBalanceItem balance = AccountBalanceItem(
              dealerCode: element['CUST'],
              fiType: element['FITYPE'],
              fiNumber: element['FINO'],
              bank: element['BANK'],
              fiDate: _dateFormatter(element['FIDATE']),
              balance: _thousandSepratorFfbl(element['AMT']
                  .toString()
                  .substring(0, element['AMT'].toString().indexOf('.'))),
            );
            dealerBal.add(balance);
          }
        }
      });
    } catch (error) {
      //print(error);
    }

    return dealerBal;
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
                'Account Balance',
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
            ])),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 25,
                  width: double.infinity,
                  child: Text(
                    Globals.dealerCode,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 35,
                  width: double.infinity,
                  child: Text(
                    Globals.dealerName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(
                //     left: 10,
                //   ),
                //   alignment: Alignment.centerLeft,
                //   height: 25,
                //   width: double.infinity,
                //   child: Text(
                //     Globals.dealerAddress,
                //     style: TextStyle(
                //       fontSize: 16,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Container(
                    // padding: EdgeInsets.only(
                    //   bottom: 50,
                    // ),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'As on ' + todayDate,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.only(
                //     top: 10,
                //     left: 10,
                //     bottom: 1,
                //   ),
                //   alignment: Alignment.centerLeft,
                //   height: 50,
                //   width: double.infinity,
                //   child: Text(
                //     'Total Balance: ' + _totalDealerBalance.toString(),
                //     style: TextStyle(
                //       fontSize: 22,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    '[Disclaimer: Subject to confirmation & verification]',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
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
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: const Text(
                          'FI Type',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 15,
                          //top: 10,
                        ),
                        alignment: Alignment.centerRight,
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: const Text(
                          'Date',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: const Text(
                          'FI Number',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.31,
                        child: const Text(
                          'Amount (Rs)',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 185),
              child: ListView(
                children: [
                  FutureBuilder(
                    future: _firstRun ? _getJsonData() : null,
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
                        return Column(
                          children: <Widget>[
                            ...dealerBal,
                            Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                bottom: 1,
                              ),
                              alignment: Alignment.centerLeft,
                              height: 40,
                              width: double.infinity,
                              child: Text(
                                '____________',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                bottom: 1,
                              ),
                              alignment: Alignment.centerLeft,
                              height: 40,
                              width: double.infinity,
                              child: Text(
                                'FFC Prod. Balance (Rs):  ' +
                                    _thousandSeprator2(_totalDealerBalanceFfc),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                bottom: 1,
                              ),
                              alignment: Alignment.centerLeft,
                              height: 40,
                              width: double.infinity,
                              child: Text(
                                'FFBL Prod. Balance (Rs):  ' +
                                    _thousandSeprator2(_totalDealerBalanceFfbl),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 10,
                                bottom: 1,
                              ),
                              alignment: Alignment.centerLeft,
                              height: 50,
                              width: double.infinity,
                              child: Text(
                                'Total (Rs):  ' +
                                    _thousandSeprator2(_totalDealerBalance),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ],
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

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './invoice_noti_disp_item.dart';
import '../colors.dart';
import '../home/home_tabs_screen.dart';
import '../globals.dart';

class InvoiceNotifDispScreen extends StatefulWidget {
  static const routeName = '/disInvNot';
  @override
  _InvoiceNotifDispScreenState createState() => _InvoiceNotifDispScreenState();
}

class _InvoiceNotifDispScreenState extends State<InvoiceNotifDispScreen> {
  var _isInit = true;
  List<InvoiceNotiDispItem> invoiceItems = [];
  String invoiceNumber;
  // String billDate;
  // String readDate;
  // String notif;
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

  Future<List<InvoiceNotiDispItem>> _getJsonData() async {
    final username = Globals.serviceUserName;
    final password = Globals.servicePass;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    final String url =
        'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDAINVNOTDISP_SRV/ZSDAInvNotDisp(\'' +
            invoiceNumber +
            '\')?sap-client=500&\$format=json';

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };

    try {
      var response = await http.get(url, headers: headers);
      //print(response.statusCode);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as Map<String, dynamic>;

        var vdata = jsonData['d'];
        //var xdata = vdata['id'] as List;
        InvoiceNotiDispItem invItem = InvoiceNotiDispItem(
          invoiceNo: vdata['INVNO'],
          billDate: _dateFormatter(vdata['BILLDATE']),
          readDate: vdata['READDATE'],
          notif: vdata['NOTIF'],
        );

        invoiceItems.add(invItem);
      } else {
        InvoiceNotiDispItem invtem = InvoiceNotiDispItem(
          invoiceNo: '',
          billDate: '',
          readDate: '',
          notif: 'Not found',
        );
        invoiceItems.add(invtem);
      }
    } catch (error) {
      //print(error);
    }
    return invoiceItems;
  }

  @override
  Widget build(BuildContext context) {
    //extracting data sent from po_item screen
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    invoiceNumber = routeArgs['invNumber'];
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
                'Notif Display',
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
                  top: 20,
                ),
                width: double.infinity,
                child: Text(
                  'انوائس اطلاع کی تفصیلات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(
              //     top: 70,
              //   ),
              //   width: double.infinity,
              //   child: Text(
              //     'نوٹ: پچھلے تین دن تک کی پلانٹ انوائسز درج نہیں ہیں',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontFamily: 'Urdu',
              //       color: Colors.red,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 100, right: 8, left: 8, bottom: 8),
              //   child: SizedBox(
              //     height: 40,
              //     width: double.infinity,
              //     child: Container(
              //       color: Colors.amber.shade400,
              //       child: TextButton.icon(
              //         onPressed: () {
              //           launch(_urlReport);
              //           // Fluttertoast.showToast(
              //           //     msg: "Under Development...",
              //           //     toastLength: Toast.LENGTH_SHORT,
              //           //     gravity: ToastGravity.CENTER,
              //           //     timeInSecForIosWeb: 1,
              //           //     backgroundColor: Colors.teal.shade800,
              //           //     textColor: Colors.white,
              //           //     fontSize: 16.0);
              //         },
              //         icon: const Icon(
              //           Icons.view_comfortable_rounded,
              //           color: Colors.teal,
              //           size: 26,
              //         ),
              //         label: const Text(
              //           'View Invoices Report',
              //           style: TextStyle(
              //             fontSize: 20,
              //             color: Colors.black,
              //             //fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         //color: Colors.orangeAccent,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
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

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './po_detail_item.dart';
import '../globals.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class PoDealerWiseScreen extends StatefulWidget {
  //This is for customer wise detail of pending orders
  static const routeName = '/poDealerScreen';
  @override
  _PoDealerWiseScreenState createState() => _PoDealerWiseScreenState();
}

class _PoDealerWiseScreenState extends State<PoDealerWiseScreen> {
  TextEditingController _textController = TextEditingController();
  var _isInit = true;
  var _firstRun = true;
  List<PendingOrderDetailItem> podItems = [];
  List<PendingOrderDetailItem> newPodItems = [];
  DateFormat formatter = DateFormat();
  NumberFormat formatPO = NumberFormat('#,###,###');
  String todayDate = '';
  String prodName = '';

  final String url =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZPODETAIL_SRV/ZPODet?sap-client=500&\$format=json';

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
    var vYear = inDate.substring(4, 6);
    return vDay + '-' + vMonth + '-' + vYear;
  }

  // String _thousandSeprator(dynamic value) {
  //   var intValue =
  //       int.parse(value.toString().substring(0, value.toString().indexOf('.')));
  //   var returnValue = formatPO.format(intValue);
  //   return returnValue;
  // }

  Future<List<PendingOrderDetailItem>> _getJsonData() async {
    _firstRun = false;
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
      //print(response.statusCode);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        if (element['CUSTOMER'] == '000' + Globals.dealerCode &&
            element['PROD'] == prodName) {
          PendingOrderDetailItem podItem = PendingOrderDetailItem(
            dealerCode: element['CUSTOMER'],
            dealerName: element['NAME1'],
            orderNum: element['ORDER_NUMBER'],
            orderDate: _dateFormatter(element['ORDER_DATE']),
            prodSrl: element['SRL'].toString(),
            prodName: element['PROD'],
            pendingQTy: element['PO_QTY'],
          );

          podItems.add(podItem);
        }
      });
    } catch (error) {
      //print(error);
    }

    var now = new DateTime.now();
    todayDate = formatter.format(now);

    //for filtering data in search for later use
    newPodItems.clear();
    newPodItems = List.from(podItems);

    //sorting the list on dealer name
    newPodItems.sort((a, b) => a.dealerName.compareTo(b.dealerName));
    podItems.sort((a, b) => a.dealerName.compareTo(b.dealerName));
    return podItems;
  }

  void onItemChanged(String value) {
    setState(() {
      newPodItems.clear();
      newPodItems = podItems
          .where((string) =>
              string.dealerName.toLowerCase().contains(value.toLowerCase()))
          .toList();
      newPodItems.sort((a, b) => a.dealerName.compareTo(b.dealerName));
    });
  }

  @override
  Widget build(BuildContext context) {
    //extracting data sent from po_item screen
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    prodName = routeArgs['prodName'];
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
              ]),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Search Order Number Here...',
                ),
                onChanged: onItemChanged,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: 5,
            //   ),
            //   child: Container(
            //     height: 30,
            //     //decoration: BoxDecoration(color: Colors.grey),
            //     color: Colors.amber,
            //     child: Column(
            //       children: [
            //         Row(
            //           children: [
            //             Container(
            //               padding: EdgeInsets.only(
            //                 left: 20,
            //               ),
            //               alignment: Alignment.centerLeft,
            //               height: 30,
            //               width: 250,
            //               child: Text(
            //                 'Dealer Code & Name',
            //                 style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
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
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 1.0, right: 1.0),
                          child: Column(
                            children: <Widget>[
                              ...newPodItems,
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    bottom: 50,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'As on ' + todayDate,
                                    style: TextStyle(
                                      fontSize: 16,
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

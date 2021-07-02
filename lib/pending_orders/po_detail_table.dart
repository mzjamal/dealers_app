import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../globals.dart';
import '../home/home_tabs_screen.dart';
import './po_detail_item.dart';
import '../colors.dart';

class PendingOrdersDetail extends StatefulWidget {
  //This is for customer wise detail of pending orders
  static const routeName = '/poDetail';
  @override
  _PendingOrdersDetailState createState() => _PendingOrdersDetailState();
}

class _PendingOrdersDetailState extends State<PendingOrdersDetail> {
  //TextEditingController _textController = TextEditingController();
  var _isInit = true;
  var _firstRun = true;
  List<DataRow> poDetail = [];
  List<PendingOrderDetailItem> podItems = [];
  DateFormat formatter = DateFormat();
  NumberFormat formatPO = NumberFormat('#,###,###');
  String todayDate = '';
  String prodName = '';
  String pendingTotal = '';
  var rowSelection = true;
  String orderNum = '';
  String orderDate = '';
  String pendingQTy = '';

  // final String url =
  //     'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZPODETAIL_SRV/ZPODet?sap-client=500&\$format=json';
  final String url =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDAPODET_SRV/ZSDAPODet?sap-client=500&\$filter=CUSTOMER eq \'000' +
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

  int _pendingQtyInt(dynamic value) {
    var intValue =
        int.parse(value.toString().substring(0, value.toString().indexOf('.')));
    //var returnValue = formatPO.format(intValue);
    return intValue;
  }

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
        if (element['PROD'] == prodName) {
          PendingOrderDetailItem podItem = PendingOrderDetailItem(
            dealerCode: element['CUSTOMER'],
            dealerName: element['NAME1'],
            orderNum: element['ORDER_NUMBER'],
            orderDate: _dateFormatter(element['ORDER_DATE']),
            prodSrl: element['SRL'].toString(),
            prodName: element['PROD'],
            pendingQTy: _pendingQtyInt(element['PO_QTY']),
            orderQty: _pendingQtyInt(element['ORDQTY']),
            deliverdQty: _pendingQtyInt(element['DELQTY']),
          );

          podItems.add(podItem);
        }
      });
    } catch (error) {
      //print(error);
    }

    var now = new DateTime.now();
    todayDate = formatter.format(now);

    return podItems;
  }

  bool _rowSelection() {
    if (rowSelection) {
      rowSelection = false;
      return true;
    } else {
      rowSelection = true;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    //extracting data sent from po_item screen
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    prodName = routeArgs['prodName'];
    pendingTotal = routeArgs['pendingTotal'];
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
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: FutureBuilder(
            future: _firstRun ? _getJsonData() : null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  height: double.infinity,
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
                  padding: const EdgeInsets.only(top: 5, left: 1.0, right: 1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          child: Text(
                            prodName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Total Pending Qty (MT): ' + pendingTotal,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '[Quantity in MT]',
                            style: TextStyle(
                              fontSize: 16,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      SingleChildScrollView(
                        child: DataTable(
                          columnSpacing: 10,
                          headingRowHeight: 50,
                          headingRowColor: MaterialStateColor.resolveWith(
                            (states) {
                              return Colors.amber.shade400;
                            },
                          ),
                          horizontalMargin: 15,
                          headingTextStyle: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 16,
                          ),
                          sortColumnIndex: 2,
                          //onSelectAll: (b) {},
                          sortAscending: true,
                          dividerThickness: 2,
                          showBottomBorder: true,
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Order',
                              ),
                              numeric: false,
                              onSort: (i, b) {
                                setState(() {
                                  podItems.sort((a, b) =>
                                      a.orderNum.compareTo(b.orderNum));
                                });
                              },
                              //tooltip: "Order Number",
                            ),
                            DataColumn(
                              label: Text(
                                'Date',
                              ),
                              numeric: false,
                              onSort: (i, b) {
                                setState(() {
                                  podItems.sort((a, b) =>
                                      a.orderDate.compareTo(b.orderDate));
                                });
                              },
                            ),
                            DataColumn(
                              label: Text(
                                'Qty',
                              ),
                              numeric: true,
                              onSort: (i, b) {
                                setState(() {
                                  podItems.sort((a, b) =>
                                      a.orderQty.compareTo(b.orderQty));
                                });
                              },
                            ),
                            DataColumn(
                              label: Text(
                                'Delv',
                              ),
                              numeric: true,
                              onSort: (i, b) {
                                setState(() {
                                  podItems.sort((a, b) =>
                                      a.deliverdQty.compareTo(b.deliverdQty));
                                });
                              },
                            ),
                            DataColumn(
                              label: Text(
                                'Pend',
                              ),
                              numeric: true,
                              onSort: (i, b) {
                                setState(() {
                                  podItems.sort((a, b) =>
                                      a.pendingQTy.compareTo(b.pendingQTy));
                                });
                              },
                            ),
                          ],
                          rows: podItems
                              .map(
                                (e) => DataRow(
                                  selected: _rowSelection(),
                                  cells: [
                                    DataCell(
                                      Text(
                                        e.orderNum,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        e.orderDate,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        e.orderQty.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        e.deliverdQty.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        e.pendingQTy.toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 30),
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
        ),
      ),
    );
  }
}

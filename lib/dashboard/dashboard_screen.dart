import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './dashboard_tiles_item.dart';
import '../colors.dart';
import '../globals.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _isInit = true;
  final List<DashboardTilesItem> kpiItems = [];
  NumberFormat format = NumberFormat('#,###,###');
  DashboardTilesItem kpiItem;

  final String url =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDAKPISUMMARY_SRV/ZSDAKPISummary?sap-client=500&\$filter=CUSTCODE eq \'' +
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

  String _thousandSeprator(dynamic value) {
    var intValue = int.parse(value);
    var returnValue = format.format(intValue);
    return returnValue;
  }

  Future<List<DashboardTilesItem>> _getJsonData() async {
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
        //if (element['CUSTCODE'] == Globals.dealerCode) {
        if (element['KPICODE'] != '8') {
          kpiItem = DashboardTilesItem(
            id: int.parse(element['KPICODE']),
            title: element['KPIDESC'],
            subTitle: _thousandSeprator(element['KPIVAL']),
            unit: element['VUNIT'],
          );
          kpiItems.add(kpiItem);
        } else {
          kpiItem = DashboardTilesItem(
            id: int.parse(element['KPICODE']),
            title: element['KPIDESC'],
            subTitle: element['KPIVAL'],
            unit: element['VUNIT'],
          );
          kpiItems.add(kpiItem);
        }
        //}
      });
    } catch (error) {
      //print(error);
      Fluttertoast.showToast(
          msg: "Following error occurs: " + error,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return kpiItems;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
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
          padding: EdgeInsets.only(
            top: 40,
            left: 10,
            right: 10,
          ),
          child: FutureBuilder(
            future: _getJsonData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
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
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Container(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: GridView(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      children: kpiItems,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      )),
                );
              }
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: 50,
          ),
          width: double.infinity,
          child: Text(
            'مزید تفصیل کے لئے کسی بھی ٹائل پر ٹیپ کریں',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Urdu',
            ),
          ),
        ),
        Container(
          color: Colors.amber.shade400,
          width: MediaQuery.of(context).size.width,
          height: 40,
          padding: EdgeInsets.only(
            top: 12,
            left: 10,
          ),
          child: Text(
            'WELCOME ' + Globals.dealerName + '  [' + Globals.dealerCode + ']',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}

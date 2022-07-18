import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import './authenticated.dart';
import './not_authenticated.dart';
import '../globals.dart' as global;

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String identifier;
  int item_count = 0;
  //String userMessage = '';
  var _isInit = true;
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // String saleRegion = '';
  String saleDist = '';
  String name = '';
  // String desig = '';
  String deviceID = '';

  @override
  void initState() {
    //initUniqueIdentifierState();
    super.initState();
  }

  // final String url =
  //     'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDADEALVERIF_SRV/ZSDADealVerif?sap-client=500&\$filter=UUID eq \'' +
  //         identifier +
  //         '\'&\$format=json';

  @override
  void didChangeDependencies() {
    if (_isInit) {}
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> initUniqueIdentifierState() async {
    //if user in using android
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      identifier = build.androidId; //UUID for Android
    }
    //if user in using iOS
    if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      identifier = data.identifierForVendor; //UUID for iOS
    }
  }

  Future<String> _getJsonData() async {
    final username = global.Globals.serviceUserName;
    final password = global.Globals.servicePass;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };

    try {
      await initUniqueIdentifierState();
      final String url =
          'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDADEALVERIF_SRV/ZSDADealVerif?sap-client=500&\$filter=UUID eq \'' +
              identifier +
              '\'&\$format=json';

      var response = await http.get(url, headers: headers);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        //if (element['UUID'] == identifier) {
        item_count = item_count + 1;
        saleDist = element['SDIST'].toString();
        name = element['NAME'].toString();
        deviceID = element['UUID'].toString();
        //setting global values
        global.Globals.globalSalesDist = element['SDIST'].toString();
        global.Globals.dealerCode = element['CUSTCODE'].toString();
        global.Globals.dealerName = element['NAME'].toString();
        global.Globals.dealerAddress = element['ADDR'].toString();
        global.Globals.deviceUUID = element['UUID'].toString();
        //}
      });
    } catch (error) {
      //print(error);
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Colors.orange.shade100,
                  Colors.green.shade100,
                  Colors.blue.shade200
                ])),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/ffc.png',
                        height: 40,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/sona.png',
                        height: 60,
                        width: 48,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text(
                    'Fauji Fertilizer Company Limited',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sona Dost',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Version 2.0.6',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text(userMessage),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        FutureBuilder(
                          future: _getJsonData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                              return Container(
                                height: 200,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            } else {
                              return item_count > 0
                                  ? Authenticated(
                                      userName: name,
                                      desig: saleDist,
                                    )
                                  : NotAuthenticated(
                                      deviceInfo: identifier,
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
        ),
      ),
    );
  }
}

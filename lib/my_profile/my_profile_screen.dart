import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../contact_officers/contact_officers.dart';
import './my_profile_item.dart';
import '../globals.dart';
import '../colors.dart';

class MyProfileScreen extends StatefulWidget {
  static const routeName = '/myProfScreen';
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  var _isInit = true;
  var _firstRun = true;
  List<MyProfileItem> profiles = [];
  //8855 for http and 8856 for https for PRD
  // final String url =
  //     'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZDPROFILENEW_SRV/ZDProfNew?sap-client=500&\$format=json';
  final String url =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDAPROFILE1_SRV/ZSDAProfile1?sap-client=500&\$filter=CUSTCODE eq \'' +
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
    var vYear = inDate.substring(4, 8);
    return vDay + '-' + vMonth + '-' + vYear;
  }

  Future<List<MyProfileItem>> _getJsonData() async {
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
      //print('inside getJsonData fun');

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        //if (element['CUSTCODE'] == Globals.dealerCode) {
        MyProfileItem myProfile = MyProfileItem(
          salesZone: element['ZONE'],
          salesRegion: element['REGION'],
          salesDist: element['DIST'],
          dealerCode: element['CUSTCODE'],
          dealerName: element['NAME'],
          address: element['ADDR'],
          contactNumber: element['MOBILE'],
          proprietorName: element['PROPRIETOR'],
          setUpDate: _dateFormatter(element['SETUPDAT']),
          salePointCode: element['SALEPOINT'],
          salePointDesc: element['SPDESC'],
          cnicNo: element['CNIC'],
          filerStatus: element['FILERDESC'],
          gstRegStatus: element['GSTDESC'],
          ntnNo: element['NTN'],
          strnNo: element['STRN'],
          contactPerson: element['CONTNAME'],
          contactPerCell: element['CONTCELL'],
        );

        profiles.add(myProfile);
        // }
      });
    } catch (error) {
      //print(error);
    }

    return profiles;
    //return newDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Profile'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.home),
      //       onPressed: () {
      //         Navigator.of(context)
      //             .pushReplacementNamed(HomeTabsScreen.routeName);
      //       },
      //     ),
      //   ],
      // ),
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
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 55,
              ),
              width: double.infinity,
              child: Text(
                'بنیادی معلومات میں تبدیلی کے لئے افسر سے رابطہ کریں',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
            Container(
              color: Colors.amber.shade400,
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.only(
                top: 5,
                right: 10,
                //left: 10,
              ),
              child: Text(
                'بنیادی معلومات',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                //print('hello');
                //launch(('tel://${'03458792281'}'));
                Navigator.pushNamed(
                  context,
                  ContactOfficers.routeName,
                );
              },
              icon: Icon(
                Icons.person,
                color: Colors.grey.shade600,
                size: 35,
              ),
              label: Text(
                '[Contact Officer]',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              //color: Colors.orangeAccent,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Scrollbar(
                thickness: 10.0,
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
                                  //backgroundColor: Colors.black,
                                  ),
                            ),
                          );
                        } else {
                          return Column(
                            children: <Widget>[...profiles],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

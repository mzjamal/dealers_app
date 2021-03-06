import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import './home_screen_item.dart';
import '../globals.dart';
import '../colors.dart';
import '../kashtkaar_desk/crop_documentaries/crop_doc_screen.dart';
import '../kashtkaar_desk/crop_booklets/crop_booklets_screen.dart';
import '../kashtkaar_desk/zarai_reports/zarai_report_screen.dart';
import '../fertilizers/fert_screen.dart';
import './home_screen_tiles_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _notifCount = 0;
  List<HomeScreenItem> homeItems = [];
  final String _urlFFC = 'https://www.ffc.com.pk/company-profile';

  final String _urlAgri =
      'https://www.ffc.com.pk/wp-content/uploads/Agri-Experts-Contact-List-2.pdf';

  final String urlNotif =
      'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDATOTNOT_SRV/ZSDATotNot?sap-client=500&\$filter=CUSTCODE eq \'' +
          Globals.dealerCode +
          '\'&\$format=json';

  @override
  void initState() {
    Globals.overAllNotifications = 'Loading..';
    super.initState();
    _setNotificationsData();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //print('Inside didChangeDependencies');
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _setNotificationsData() async {
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
      //print("hellooo");
      var response = await http.get(urlNotif, headers: headers);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;
      _notifCount = 0;
      xdata.forEach((element) {
        if (element['CUSTCODE'] == Globals.dealerCode) {
          _notifCount = _notifCount + int.parse(element['NCOUNT']);
        }
      });
      //print("Overall Notif:");
      //print(_notifCount);
      Globals.overAllNotifications = _notifCount.toString();
      setState(() {});
    } catch (error) {
      Fluttertoast.showToast(
          msg: error,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.teal.shade600,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // Future<List<HomeScreenItem>> _getJsonData() async {
  //   final username = Globals.serviceUserName;
  //   final password = Globals.servicePass;
  //   final credentials = '$username:$password';
  //   final stringToBase64 = utf8.fuse(base64);
  //   final encodedCredentials = stringToBase64.encode(credentials);

  //   Map<String, String> headers = {
  //     HttpHeaders.contentTypeHeader: "application/json",
  //     HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
  //   };

  //   try {
  //     var response = await http.get(url, headers: headers);

  //     var jsonData = json.decode(response.body) as Map<String, dynamic>;

  //     var vdata = jsonData['d'];
  //     var xdata = vdata['results'] as List;

  //     xdata.forEach((element) {
  //       //if (element['CUSTCODE'] == Globals.dealerCode) {
  //       HomeScreenItem homeItem = HomeScreenItem(
  //         element['TILECODE'],
  //         element['TILETITLE'],
  //         element['SUBTITLE'],
  //         element['NOTIFCOUNT'],
  //       );
  //       homeItems.add(homeItem);
  //       //}
  //     });
  //   } catch (error) {
  //     Fluttertoast.showToast(
  //         msg: error,
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.teal.shade600,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }

  //   return homeItems;
  // }

  String _notifCountDisp(String id) {
    if (id == 't5') {
      return Globals.overAllNotifications;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _imageSlideCarousel = Container(
      padding: EdgeInsets.only(
        top: 40,
      ),
      height: 200, //MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Carousel(
        boxFit: BoxFit.fill,
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        dotColor: Colors.amber,
        dotBgColor: Colors.transparent,
        autoplayDuration: Duration(seconds: 5),
        //showIndicator: false,
        indicatorBgPadding: 5.0,
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotVerticalPadding: 5.0,
        dotPosition: DotPosition.bottomRight,
        images: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CropDocumentaryScreen.routeName);
                  },
                  child: Image.asset(
                    'assets/images/1.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Text(
                  '?????????? ???? ???????????????? ??????????',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 125,
                ),
                child: Text(
                  '?????????????? ???? ?????? ???????? ?????? ????????',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber.shade400,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CropBookletsScreen.routeName);
                  },
                  child: Image.asset(
                    'assets/images/2.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Text(
                  '?????????? ???? ????????????',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue.shade900,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 125,
                ),
                child: Text(
                  '?????????????? ???? ?????? ???????? ?????? ????????',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ZaraiReportScreen.routeName);
                  },
                  child: Image.asset(
                    'assets/images/3.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Text(
                  '???????? ????????????',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 125,
                ),
                child: Text(
                  '?????????????? ???? ?????? ???????? ?????? ????????',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber.shade400,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () => launch(_urlAgri),
                  child: Image.asset(
                    'assets/images/4.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Text(
                  '???????? ????????????',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 125,
                ),
                child: Text(
                  '?????????????? ???? ?????? ???????? ?????? ????????',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber.shade400,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(FertilizersScreen.routeName);
                  },
                  child: Image.asset(
                    'assets/images/5.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Text(
                  ' ?????? ?????? ???? ???? ????????????',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue.shade900,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 125,
                ),
                child: Text(
                  '?????????????? ???? ?????? ???????? ?????? ????????',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () => launch(_urlFFC),
                  child: Image.asset(
                    'assets/images/6.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Text(
                  '?????????? ???? ??????????????',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 125,
                ),
                child: Text(
                  '?????????????? ???? ?????? ???????? ?????? ????????',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber.shade400,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // Widget _textSlideCarousel = Container(
    //   padding: EdgeInsets.only(
    //     top: 60,
    //   ),
    //   height: MediaQuery.of(context).size.height * 0.15,
    //   width: MediaQuery.of(context).size.width,
    //   child: Carousel(
    //     //boxFit: BoxFit.fill,
    //     autoplay: true,
    //     dotColor: Colors.transparent,
    //     dotBgColor: Colors.transparent,
    //     //indicatorBgPadding: 5.0,
    //     dotSize: 0.0,
    //     //dotSpacing: 0.0,
    //     //dotVerticalPadding: 0.0,
    //     dotPosition: DotPosition.topRight,
    //     images: [
    //       Container(
    //         padding: EdgeInsets.only(
    //           left: 20,
    //         ),
    //         child: Text(
    //           'Fruits',
    //           style: TextStyle(
    //             fontSize: 24,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.only(
    //           left: 20,
    //         ),
    //         child: Text(
    //           'Wind Power',
    //           style: TextStyle(
    //             fontSize: 24,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.only(
    //           left: 20,
    //         ),
    //         child: Text(
    //           'Buildings',
    //           style: TextStyle(
    //             fontSize: 24,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.only(
    //           left: 20,
    //         ),
    //         child: Text(
    //           'Green Fields',
    //           style: TextStyle(
    //             fontSize: 24,
    //             color: Colors.white,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // do what you want here
    //   print("inside build...");
    //   _setNotificationsData();
    //   //setState(() {});
    // });
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 220.0),
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 215,
                  left: 10,
                  right: 10,
                ),
                child: GridView(
                  padding: const EdgeInsets.only(
                    top: 10,
                    //bottom: 20,
                  ),
                  children: homeTiles
                      .map(
                        (tileData) => HomeScreenItem(
                          tileData.id,
                          tileData.title,
                          tileData.subTitle,
                          _notifCountDisp(tileData.id),
                        ),
                      )
                      .toList(),
                  //Sliver are scrollable areas on screen in Flutter
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.amber.shade400,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
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
        _imageSlideCarousel,
        //_textSlideCarousel,
      ],
    );
  }
}

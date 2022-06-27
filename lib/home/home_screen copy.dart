// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import './home_screen_tiles_data.dart';
// import './home_screen_item.dart';
// import '../globals.dart';
// import '../colors.dart';
// import '../kashtkaar_desk/crop_documentaries/crop_doc_screen.dart';
// import '../kashtkaar_desk/crop_booklets/crop_booklets_screen.dart';
// import '../kashtkaar_desk/zarai_reports/zarai_report_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final String _urlFFC = 'https://www.ffc.com.pk/company-profile';

//   final String _urlFert =
//       'https://www.ffc.com.pk/products-services/#fertilizers';

//   final String _urlAgri =
//       'https://www.ffc.com.pk/wp-content/uploads/Agri-Experts-Contact-List-2.pdf';
//   final String url =
//       'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZSDATOTNOT_SRV/ZSDATotNot?sap-client=200&\$format=json';

//   @override
//   void initState() {
//     super.initState();
//   }

//   // @override
//   // void didChangeDependencies() async {
//   //   await _setNotificationsData();
//   //   print('Overall : ' + Globals.overAllNotifications.toString());
//   //   super.didChangeDependencies();
//   // }

//   // Future<void> _setNotificationsData() async {
//   //   final username = Globals.serviceUserNameDev;
//   //   final password = Globals.servicePassDev;
//   //   final credentials = '$username:$password';
//   //   final stringToBase64 = utf8.fuse(base64);
//   //   final encodedCredentials = stringToBase64.encode(credentials);

//   //   Map<String, String> headers = {
//   //     HttpHeaders.contentTypeHeader: "application/json",
//   //     HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
//   //   };

//   //   try {
//   //     var response = await http.get(url, headers: headers);

//   //     var jsonData = json.decode(response.body) as Map<String, dynamic>;

//   //     var vdata = jsonData['d'];
//   //     var xdata = vdata['results'] as List;

//   //     xdata.forEach((element) {
//   //       if (element['CUSTCODE'] == Globals.dealerCode) {
//   //         if (element['NOTTYP'] == 'IN') {
//   //           Globals.newInvoiceNotifications = int.parse(element['NCOUNT']);
//   //           Globals.overAllNotifications =
//   //               Globals.overAllNotifications + int.parse(element['NCOUNT']);
//   //         }
//   //         if (element['NOTTYP'] == 'ON') {
//   //           Globals.newOrderNotifications = int.parse(element['NCOUNT']);
//   //           Globals.overAllNotifications =
//   //               Globals.overAllNotifications + int.parse(element['NCOUNT']);
//   //         }
//   //       }
//   //     });
//   //   } catch (error) {
//   //     Fluttertoast.showToast(
//   //         msg: error,
//   //         toastLength: Toast.LENGTH_LONG,
//   //         gravity: ToastGravity.CENTER,
//   //         timeInSecForIosWeb: 1,
//   //         backgroundColor: Colors.teal.shade600,
//   //         textColor: Colors.white,
//   //         fontSize: 16.0);
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     Widget _imageSlideCarousel = Container(
//       padding: EdgeInsets.only(
//         top: 40,
//       ),
//       height: MediaQuery.of(context).size.height * 0.27,
//       width: MediaQuery.of(context).size.width,
//       child: Carousel(
//         boxFit: BoxFit.fill,
//         autoplay: true,
//         animationCurve: Curves.fastOutSlowIn,
//         dotColor: Colors.amber,
//         dotBgColor: Colors.transparent,
//         autoplayDuration: Duration(seconds: 5),
//         //showIndicator: false,
//         indicatorBgPadding: 5.0,
//         dotSize: 4.0,
//         dotSpacing: 15.0,
//         dotVerticalPadding: 5.0,
//         dotPosition: DotPosition.bottomRight,
//         images: [
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context)
//                         .pushNamed(CropDocumentaryScreen.routeName);
//                   },
//                   child: Image.asset(
//                     'assets/images/1.png',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 10,
//                 ),
//                 child: Text(
//                   'فصلوں کی دستاویزی فلمیں',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 145,
//                 ),
//                 child: Text(
//                   'تفصیلات کے لئے یہاں ٹیپ کریں',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.amber.shade400,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context)
//                         .pushNamed(CropBookletsScreen.routeName);
//                   },
//                   child: Image.asset(
//                     'assets/images/2.jpg',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 10,
//                 ),
//                 child: Text(
//                   'فصلوں کے کتابچے',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 145,
//                 ),
//                 child: Text(
//                   'تفصیلات کے لئے یہاں ٹیپ کریں',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.blue.shade900,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context)
//                         .pushNamed(ZaraiReportScreen.routeName);
//                   },
//                   child: Image.asset(
//                     'assets/images/3.jpg',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 10,
//                 ),
//                 child: Text(
//                   'زرعی رپورٹس',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 145,
//                 ),
//                 child: Text(
//                   'تفصیلات کے لئے یہاں ٹیپ کریں',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.amber.shade400,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: InkWell(
//                   onTap: () => launch(_urlAgri),
//                   child: Image.asset(
//                     'assets/images/4.jpg',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 10,
//                 ),
//                 child: Text(
//                   'زرعی ماہرین',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 145,
//                 ),
//                 child: Text(
//                   'تفصیلات کے لئے یہاں ٹیپ کریں',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.amber.shade400,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: InkWell(
//                   onTap: () => launch(_urlFert),
//                   child: Image.asset(
//                     'assets/images/5.jpg',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 10,
//                 ),
//                 child: Text(
//                   ' ایف ایف سی کی کھادیں',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 145,
//                 ),
//                 child: Text(
//                   'تفصیلات کے لئے یہاں ٹیپ کریں',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.amber.shade400,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: InkWell(
//                   onTap: () => launch(_urlFFC),
//                   child: Image.asset(
//                     'assets/images/6.png',
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 10,
//                 ),
//                 child: Text(
//                   'کمپنی کی معلومات',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10,
//                   top: 145,
//                 ),
//                 child: Text(
//                   'تفصیلات کے لئے یہاں ٹیپ کریں',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.amber.shade400,
//                     fontFamily: 'Urdu',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );

//     // Widget _textSlideCarousel = Container(
//     //   padding: EdgeInsets.only(
//     //     top: 60,
//     //   ),
//     //   height: MediaQuery.of(context).size.height * 0.15,
//     //   width: MediaQuery.of(context).size.width,
//     //   child: Carousel(
//     //     //boxFit: BoxFit.fill,
//     //     autoplay: true,
//     //     dotColor: Colors.transparent,
//     //     dotBgColor: Colors.transparent,
//     //     //indicatorBgPadding: 5.0,
//     //     dotSize: 0.0,
//     //     //dotSpacing: 0.0,
//     //     //dotVerticalPadding: 0.0,
//     //     dotPosition: DotPosition.topRight,
//     //     images: [
//     //       Container(
//     //         padding: EdgeInsets.only(
//     //           left: 20,
//     //         ),
//     //         child: Text(
//     //           'Fruits',
//     //           style: TextStyle(
//     //             fontSize: 24,
//     //             color: Colors.white,
//     //           ),
//     //         ),
//     //       ),
//     //       Container(
//     //         padding: EdgeInsets.only(
//     //           left: 20,
//     //         ),
//     //         child: Text(
//     //           'Wind Power',
//     //           style: TextStyle(
//     //             fontSize: 24,
//     //             color: Colors.white,
//     //           ),
//     //         ),
//     //       ),
//     //       Container(
//     //         padding: EdgeInsets.only(
//     //           left: 20,
//     //         ),
//     //         child: Text(
//     //           'Buildings',
//     //           style: TextStyle(
//     //             fontSize: 24,
//     //             color: Colors.white,
//     //           ),
//     //         ),
//     //       ),
//     //       Container(
//     //         padding: EdgeInsets.only(
//     //           left: 20,
//     //         ),
//     //         child: Text(
//     //           'Green Fields',
//     //           style: TextStyle(
//     //             fontSize: 24,
//     //             color: Colors.white,
//     //           ),
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // );

//     return Stack(
//       children: <Widget>[
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [
//                   MyColors.backgroundColor1,
//                   MyColors.backgroundColor2,
//                   MyColors.backgroundColor3,
//                 ]),
//           ),
//           padding: EdgeInsets.only(
//             top: MediaQuery.of(context).size.height * 0.285,
//             left: 10,
//             right: 10,
//           ),
//           child: GridView(
//             padding: const EdgeInsets.only(
//               top: 10,
//               //bottom: 20,
//             ),
//             children: homeTiles
//                 .map(
//                   (tileData) => HomeScreenItem(
//                     tileData.id,
//                     tileData.title,
//                     tileData.subTitle,
//                     '0',
//                     // tileData.tileColor,
//                     // tileData.notifCount,
//                   ),
//                 )
//                 .toList(),
//             //Sliver are scrollable areas on screen in Flutter
//             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200,
//               childAspectRatio: 3 / 2,
//               crossAxisSpacing: 15,
//               mainAxisSpacing: 15,
//             ),
//           ),
//         ),
//         Container(
//           color: Colors.amber.shade400,
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height * 0.1,
//           padding: EdgeInsets.only(
//             top: 12,
//             left: 10,
//           ),
//           child: Text(
//             'WELCOME ' + Globals.dealerName + '  [' + Globals.dealerCode + ']',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//             softWrap: true,
//           ),
//         ),
//         _imageSlideCarousel,
//         //_textSlideCarousel,
//       ],
//     );
//   }
// }

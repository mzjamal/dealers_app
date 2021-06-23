import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../home/home_tabs_screen.dart';
import '../globals.dart';
import '../colors.dart';
import './contact_officer_item.dart';

class ContactOfficers extends StatefulWidget {
  static const routeName = '/contactSupport';

  @override
  _ContactOfficersState createState() => _ContactOfficersState();
}

class _ContactOfficersState extends State<ContactOfficers> {
  var _isInit = true;
  List<ContactOffcierItem> contactOfficers = [];
  //8855 for http and 8856 for https for PRD
  final String url =
      'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZSDACONTACT_SRV/ZSDAContact(\'' +
          Globals.globalSalesDist +
          '\')?sap-client=200&\$format=json';
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

  Future<List<ContactOffcierItem>> _getJsonData() async {
    //_firstRun = false;
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

      var jsonData = json.decode(response.body) as Map<String, dynamic>;
      var vdata = jsonData['d'];

      ContactOffcierItem contactItem = ContactOffcierItem(
        saleOfficerName: vdata['SONAME'],
        saleOfficerContact: vdata['SOCELL'],
        saleOfficeEmail: vdata['DISTEMAIL'],
        agriOfficerName: vdata['ASONAME'],
        agriOfficerContact: vdata['ASOCELL'],
        agriOfficeEmail: vdata['ATOEMAIL'],
      );

      contactOfficers.add(contactItem);
    } catch (error) {
      //print(error);
    }
    return contactOfficers;
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
                'Contact Officers',
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
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 40,
              color: Colors.amber.shade400,
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  'ایف ایف سی کے افسران سے رابطہ کریں',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 5,
                right: 10,
              ),
              alignment: Alignment.center,
              child: Text(
                'افسران کو فون کرنے کے لئے سبز نشان پر یا پیغام بھیجنے کے لئے نیلے نشان پر یا ای میل بھیجنے کے لئے نارنجی نشان پر ٹیپ کریں۔',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 15,
              ),
              height: MediaQuery.of(context).size.height * 0.65,
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
                        return Column(
                          children: <Widget>[
                            ...contactOfficers,
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(
            //     top: 10,
            //   ),
            //   width: double.infinity,
            //   height: 500,
            //   child: Padding(
            //     padding: const EdgeInsets.all(10),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: <Widget>[
            //         Card(
            //           color: Colors.grey.shade200,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Column(
            //             children: [
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Container(
            //                 width: double.infinity,
            //                 height: 25,
            //                 //color: Colors.grey.shade200,
            //                 child: Text(
            //                   'Head of Sales District',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 20,
            //                     color: Colors.blue.shade800,
            //                   ),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               Container(
            //                 padding: EdgeInsets.only(
            //                   left: 10,
            //                   top: 10,
            //                   bottom: 10,
            //                 ),
            //                 width: MediaQuery.of(context).size.width,
            //                 height: 40,
            //                 color: Colors.grey.shade200,
            //                 child: const Text(
            //                   'Mr. Muhammad Arfan',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 18,
            //                   ),
            //                   textAlign: TextAlign.start,
            //                 ),
            //               ),
            //               Container(
            //                 alignment: Alignment.topLeft,
            //                 color: Colors.grey.shade200,
            //                 padding: EdgeInsets.only(
            //                   left: 10,
            //                 ),
            //                 width: MediaQuery.of(context).size.width,
            //                 height: 60,
            //                 //color: Colors.grey.shade200,
            //                 child: const Text(
            //                   'Cell No: 0345-8792281\nEmail: m_arfan@ffc.com.pk',
            //                   style: TextStyle(
            //                     fontSize: 16,
            //                   ),
            //                   textAlign: TextAlign.start,
            //                 ),
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   GestureDetector(
            //                     onTap: () {
            //                       launch(('tel://${'03458792281'}'));
            //                     },
            //                     child: Container(
            //                       padding: EdgeInsets.only(
            //                         top: 10,
            //                       ),
            //                       height: 50,
            //                       width: 50,
            //                       child: Icon(
            //                         Icons.quick_contacts_dialer_outlined,
            //                         color: Colors.green.shade500,
            //                         size: 60,
            //                       ),
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     width: 100,
            //                   ),
            //                   GestureDetector(
            //                     onTap: () {
            //                       // launch(
            //                       //     ('mailto:${'m_arfan@ffc.com.pk'}?subject=${'Sona Dealer App'}&body=${'Please conatct the undersigned for an issue in Sona dealer moible application.'}'));
            //                       launch(
            //                           'sms:03458792281?body=${'Dear Sales Officer...'}');
            //                     },
            //                     child: Container(
            //                       padding: EdgeInsets.only(
            //                         top: 10,
            //                       ),
            //                       height: 50,
            //                       width: 50,
            //                       child: Icon(
            //                         Icons.message_outlined,
            //                         color: Colors.indigo.shade500,
            //                         size: 60,
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               SizedBox(
            //                 height: 30,
            //               ),
            //             ],
            //           ),
            //           elevation: 10,
            //         ),
            //         // SizedBox(
            //         //   height: 20,
            //         // ),
            //         // Card(
            //         //   color: Colors.grey.shade200,
            //         //   shape: RoundedRectangleBorder(
            //         //     borderRadius: BorderRadius.circular(10),
            //         //   ),
            //         //   child: Column(
            //         //     children: [
            //         //       SizedBox(
            //         //         height: 10,
            //         //       ),
            //         //       Container(
            //         //         width: MediaQuery.of(context).size.width,
            //         //         height: 25,
            //         //         //color: Colors.grey.shade200,
            //         //         child: Text(
            //         //           'Agri Services Officer',
            //         //           style: TextStyle(
            //         //               fontWeight: FontWeight.bold,
            //         //               fontSize: 20,
            //         //               color: Colors.blue.shade800),
            //         //           textAlign: TextAlign.center,
            //         //         ),
            //         //       ),
            //         //       SizedBox(
            //         //         height: 10,
            //         //       ),
            //         //       Container(
            //         //         padding: EdgeInsets.only(
            //         //           left: 10,
            //         //           top: 10,
            //         //           bottom: 10,
            //         //         ),
            //         //         width: MediaQuery.of(context).size.width,
            //         //         height: 40,
            //         //         color: Colors.grey.shade200,
            //         //         child: const Text(
            //         //           'Mr. Imran Khaliq',
            //         //           style: TextStyle(
            //         //             fontWeight: FontWeight.bold,
            //         //             fontSize: 18,
            //         //           ),
            //         //           textAlign: TextAlign.start,
            //         //         ),
            //         //       ),
            //         //       Container(
            //         //         alignment: Alignment.topLeft,
            //         //         color: Colors.grey.shade200,
            //         //         padding: EdgeInsets.only(
            //         //           left: 10,
            //         //         ),
            //         //         width: MediaQuery.of(context).size.width,
            //         //         height: 60,
            //         //         //color: Colors.grey.shade200,
            //         //         child: const Text(
            //         //           'Cell No: 0346-4001234 \nEmail: imran_khaliq@ffc.com.pk',
            //         //           style: TextStyle(
            //         //             fontSize: 16,
            //         //           ),
            //         //           textAlign: TextAlign.start,
            //         //         ),
            //         //       ),
            //         //       Row(
            //         //         mainAxisAlignment: MainAxisAlignment.center,
            //         //         crossAxisAlignment: CrossAxisAlignment.center,
            //         //         children: [
            //         //           GestureDetector(
            //         //             onTap: () {
            //         //               launch(('tel://${'03464001234'}'));
            //         //             },
            //         //             child: Container(
            //         //               padding: EdgeInsets.only(
            //         //                 top: 10,
            //         //               ),
            //         //               height: 50,
            //         //               width: 50,
            //         //               child: Icon(
            //         //                 Icons.quick_contacts_dialer_outlined,
            //         //                 color: Colors.green.shade500,
            //         //                 size: 60,
            //         //               ),
            //         //             ),
            //         //           ),
            //         //           SizedBox(
            //         //             width: 100,
            //         //           ),
            //         //           GestureDetector(
            //         //             onTap: () {
            //         //               // launch(
            //         //               //     ('mailto:${'imran_khaliq@ffc.com.pk'}?subject=${'Sona Dealer Mobile App'}&body=${'Please conatct the undersigned for an issue in Sona dealer moible application.'}'));
            //         //               launch(
            //         //                   'sms:03464001234?body=${'Dear Agri Services Officer...'}');
            //         //             },
            //         //             child: Container(
            //         //               padding: EdgeInsets.only(
            //         //                 top: 10,
            //         //               ),
            //         //               height: 50,
            //         //               width: 50,
            //         //               child: Icon(
            //         //                 Icons.message_outlined,
            //         //                 color: Colors.indigo.shade500,
            //         //                 size: 60,
            //         //               ),
            //         //             ),
            //         //           ),
            //         //         ],
            //         //       ),
            //         //       SizedBox(
            //         //         height: 30,
            //         //       ),
            //         //     ],
            //         //   ),
            //         //   elevation: 10,
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

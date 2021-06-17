import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../home/home_tabs_screen.dart';
import '../globals.dart';

class Notifications extends StatefulWidget {
  static const routeName = '/notif';

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  Future<void> _updateNotificationData() async {
    //String token = '';
    final username = Globals.serviceUserName;
    final password = Globals.servicePass;
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    var postURL =
        'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZSDA_SERVICES_SRV/ZSDA_NOTIFICATIONSSet';

    try {
      Map<String, String> newBody = {
        'Dealer': '1004294',
        'Docnumb': '1234567891',
        'Doctype': 'FN',
        'Readdate': '28-05-2021 15:38 PM'
      };
      var jsonBody = json.encode(newBody);

      Map<String, String> newHeaders1 = {
        'Accept': "application/json",
        'Content-Type': "application/json",
        'X-Requested-With': 'X',
        HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
      };

      var feedback = await http.post(
        postURL,
        headers: newHeaders1,
        body: jsonBody,
      );
      int statusCode = feedback.statusCode;
      if (statusCode == 201) {
        //print('Status Code = ' + statusCode.toString());
        //print('Success');
        // //print(responseBody);
        // Fluttertoast.showToast(
        //     msg: "Location updated successfully.",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        //return json.decode(feedback.body);
      } else {
        //print('Status Code: ' + statusCode.toString());
        //print('Feedback: ' + feedback.body);
      }
    } catch (error) {
      //print(error.toString());
    }
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
                'Notifications',
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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.orange.shade100,
                Colors.green.shade100,
                Colors.blue.shade200
              ])),
          child: Container(
            //color: Colors.amber,
            height: 25,
            width: 100,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton.icon(
                onPressed: () {
                  //print('hello');
                  _updateNotificationData();
                },
                icon: const Icon(
                  Icons.done_outline_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                label: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //color: Colors.orangeAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

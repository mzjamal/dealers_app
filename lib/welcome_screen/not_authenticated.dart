import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../home/home_tabs_screen.dart';
import '../globals.dart' as global;

class NotAuthenticated extends StatefulWidget {
  final String deviceInfo;

  NotAuthenticated({
    @required this.deviceInfo,
  });

  @override
  _NotAuthenticatedState createState() => _NotAuthenticatedState();
}

class _NotAuthenticatedState extends State<NotAuthenticated> {
  TextEditingController _textContorller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onLongPress: () {
              //launch('sms:03004523363?body=${widget.deviceInfo}');
            },
            child: Text(
              'Your authentication not successful. Please contact Head of Sales District or enter password to login.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue.shade900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'آپ  کی تصدیق نہیں ہو سکی۔ برائے مہربانی  افسر سے رابطہ کریں یا لاگ ان کے لئے پاس ورڈ درج کریں۔',
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue.shade900,
              fontFamily: 'Urdu',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: _textContorller,
            obscureText: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: 'Enter Password',
              //border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              fillColor: Color(0xfff3f3f4),
              filled: false,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 1,
                    spreadRadius: 1)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xfffbb448), Color(0xfff7892b)]),
            ),
            child: GestureDetector(
              onTap: () {
                if (_textContorller.text == 'Xyz@998877') {
                  //setting global values
                  global.Globals.globalSalesDist = 'LHR';
                  global.Globals.dealerCode = '1004292';
                  global.Globals.dealerName = 'ALI & CO';
                  global.Globals.dealerAddress =
                      'TEHSIL MURIDKEY GHALLA MANDI NARANG SHEIKHUPURA';
                  global.Globals.deviceUUID = widget.deviceInfo;
                  global.Globals.vTesting = 'Y';
                  Navigator.of(context)
                      .pushReplacementNamed(HomeTabsScreen.routeName);
                } else {
                  Fluttertoast.showToast(
                      msg: 'Password is not correct. Please try again.',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.teal.shade600,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'UUID = ' + widget.deviceInfo,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          // SizedBox(
          //   height: 40,
          // ),
          // Text(
          //   'Please long tap on above red message to send the UUID on the provided cell number.',
          //   style: TextStyle(
          //     fontSize: 18,
          //     color: Colors.black,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}

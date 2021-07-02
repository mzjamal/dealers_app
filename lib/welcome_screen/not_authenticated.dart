import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      child: SingleChildScrollView(
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
                'Your authentication not successful. Please send given UUID to Head of Sales District or enter password to login.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue.shade900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'آپ  کی تصدیق نہیں ہو سکی۔ برائے مہربانی افسرکو نیچےدی گئی آئی ڈی بھیجیں یا لاگ ان کے لئے پاس ورڈ درج کریں۔',
              style: TextStyle(
                fontSize: 22,
                color: Colors.blue.shade900,
                fontFamily: 'Urdu',
              ),
              textAlign: TextAlign.center,
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
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //padding: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xfffbb448), Color(0xfff7892b)]),
              ),
              child: TextButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.deviceInfo));
                  Fluttertoast.showToast(
                      msg:
                          'UUID copied, please send it to Head of Sales District',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.teal.shade600,
                      textColor: Colors.white,
                      fontSize: 18.0);
                },
                icon: const Icon(
                  Icons.copy_rounded,
                  color: Colors.black,
                  size: 24,
                ),
                label: const Text(
                  'Copy UUID',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //color: Colors.orangeAccent,
              ),
            ),
            SizedBox(
              height: 30,
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
              //padding: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xfffbb448), Color(0xfff7892b)]),
              ),
              child: TextButton.icon(
                onPressed: () {
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
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.teal.shade600,
                        textColor: Colors.white,
                        fontSize: 18.0);
                  }
                },
                icon: const Icon(
                  Icons.login,
                  color: Colors.black,
                  size: 24,
                ),
                label: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //color: Colors.orangeAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

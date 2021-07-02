import 'package:flutter/material.dart';
import '../notifications_tiles_screen.dart';
import '../../colors.dart';

class OtherNotifDetailScreen extends StatefulWidget {
  static const routeName = '/otherNotifDet';

  @override
  _OtherNotifDetailScreenState createState() => _OtherNotifDetailScreenState();
}

class _OtherNotifDetailScreenState extends State<OtherNotifDetailScreen> {
  String rowID;
  String notDate;
  String notTitle;
  String notDesc;
  String notEnd;
  String readDate;

  @override
  Widget build(BuildContext context) {
    //extracting data sent from dealer location screen
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    rowID = routeArgs['notifNo'];
    notDate = routeArgs['notifDate'];
    notTitle = routeArgs['notifTitle'];
    notDesc = routeArgs['notifDesc'];
    notEnd = routeArgs['notifEnd'];
    readDate = routeArgs['readDate'];
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
                'Notification Detail',
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
                  .pushReplacementNamed(NotificationTilesScreen.routeName);
            },
          ),
        ],
      ),
      body: InteractiveViewer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        height: 30,
                        width: double.infinity,
                        child: Text(
                          'TITLE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        //height: 30,
                        width: double.infinity,
                        child: Text(
                          notTitle,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        height: 30,
                        width: double.infinity,
                        child: Text(
                          'NOTIFICATION DETAIL',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        child: Text(
                          notDesc,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        child: Text(
                          notEnd,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        height: 30,
                        width: double.infinity,
                        child: Text(
                          '------------------------',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        height: 30,
                        width: double.infinity,
                        child: Text(
                          'NOTIFICATION DATE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        //height: 30,
                        width: double.infinity,
                        child: Text(
                          notDate,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        height: 30,
                        width: double.infinity,
                        child: Text(
                          'READ DATE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        child: Text(
                          readDate,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.amber.shade400,
                width: MediaQuery.of(context).size.width,
                height: 45,
                padding: EdgeInsets.only(
                  top: 5,
                  //left: 10,
                ),
                child: Text(
                  'اطلاع کی تفصیل',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Urdu',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

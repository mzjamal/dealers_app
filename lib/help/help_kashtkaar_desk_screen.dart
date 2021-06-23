import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class HelpKashtkaarDeskScreen extends StatelessWidget {
  static const routeName = '/helpKasht';
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
                'Help Topics',
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              MyColors.backgroundColor1,
              MyColors.backgroundColor2,
              MyColors.backgroundColor3,
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.amber.shade400,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 8,
                        top: 10,
                      ),
                      child: Icon(
                        Icons.agriculture_outlined,
                        color: Colors.blue.shade700,
                        size: 32,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 20,
                        right: 10,
                        bottom: 10,
                      ),
                      alignment: Alignment.topLeft,
                      child: Text('Kaashtkar Desk',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.justify),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                  bottom: 10,
                ),
                alignment: Alignment.topCenter,
                child: Text(
                    'Kaashtkar desk area displays information regarding crop documentaries, zarai reports, crop booklets, list of Agri experts and access to farmer help line.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                  bottom: 10,
                ),
                alignment: Alignment.topCenter,
                child: Text(
                    'Crop documentaries area lists documentaries of common crops which can be viewed. Zarai reports include most recent four quarterly reports which can be downloaded in PDF format.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                  bottom: 10,
                ),
                alignment: Alignment.topCenter,
                child: Text(
                    'Crop booklets provide different crops\' related information regarding cultivation. This information can be downloaded in PDF format. ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                  bottom: 10,
                ),
                alignment: Alignment.topCenter,
                child: Text(
                    'Agri experts list can be downloaded that includes FFC\'s Agri Officers list country wide. Finally, farmer help line option can be used to dial famer help line number.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                  bottom: 5,
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  '[Note]',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 1,
                  right: 10,
                  bottom: 10,
                ),
                alignment: Alignment.topCenter,
                child: Text(
                    'Please contact Head of Sales District / Agri Services Officer for further detail.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

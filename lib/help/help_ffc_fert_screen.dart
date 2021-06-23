import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class HelpFfcFertScreen extends StatelessWidget {
  static const routeName = '/helpFfcFert';
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
                        Icons.grass_outlined,
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
                      child: Text('FFC\'s Fertilizers',
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
                    'This screen provides detailed information regarding different fertilizers manufactured and marketed by FFC. Information is provided in Urdu.',
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
                    'Click on any fertilizer product to view details in Urdu. Importance of a particular fertilizer along with its proper use on crops is briefed.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify),
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   padding: EdgeInsets.only(
              //     left: 10,
              //     top: 10,
              //     right: 10,
              //     bottom: 10,
              //   ),
              //   alignment: Alignment.topCenter,
              //   child: Text(
              //       'This information can further be discussed with Agri Officer for under',
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              //       textAlign: TextAlign.justify),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   padding: EdgeInsets.only(
              //     left: 10,
              //     top: 10,
              //     right: 10,
              //     bottom: 10,
              //   ),
              //   alignment: Alignment.topCenter,
              //   child: Text(
              //       'Agri experts list can be downloaded that includes FFC\'s Agri Officers list country wide. Finally, farmer help line option can be used to dial famer help line number.',
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              //       textAlign: TextAlign.justify),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
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

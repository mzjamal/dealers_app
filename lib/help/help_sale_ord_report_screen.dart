import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class HelpSaleOrderReportScreen extends StatelessWidget {
  static const routeName = '/helpSaleRept';

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
                        Icons.description_outlined,
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
                      child: Text('Sales Order Report',
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
                    'Sales order report screen displays list of sales orders along with total number of orders in current year information.',
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
                    'Sales orders information in blue text depicts sales orders which have been completely shipped.',
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
                    'Order\'s information includes sale order number, order date, product, order quantiy and plant/warehouse order information. A formatted report is provided to download orders list in PDF format. Click on report button to download the report.',
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
              //       'Sale Order number, order date, product and pending quantity in MT information is available on details page.',
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
                    'Please contact Head of Sales District for further detail.',
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

import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class HelpProdPriceListScreen extends StatelessWidget {
  static const routeName = '/helpProPric';
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
                        Icons.print_outlined,
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
                      child: Text('Product Price List',
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
                    'Product price list tile provides product wise price list in a formatted report.',
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
                    'Effective date of the given price is displayed against each product. This report can be downloaded in mobile and printed as per requirement. ',
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
                    'Product prices in this report are based on a particular sales district. Sales district information is also provided in report.',
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

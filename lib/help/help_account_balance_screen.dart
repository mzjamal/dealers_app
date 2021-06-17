import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class HelpAccountBalScreen extends StatelessWidget {
  static const routeName = '/helpAccBal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Row(
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
                        Icons.account_balance_outlined,
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
                      child: Text('Account Balance',
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
                    'Dealer account balance screen shows dealer balances along with dealer basic information.',
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
                    'Please note that only those FI types have been used for dealer balance calculation which can be used for sales order creation.',
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
                    'Following financial instrument (FI) types for cash order generation have been included while calculating dealer balance.',
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
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - ASC (ASK SONA CARD SLIP)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 10,
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - CDS (CASH DEPOSIT SLIP)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 10,
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - CRM (CREDIT MEMO)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 10,
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - DD (DEMAND DRAFT)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 10,
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - DMA (DMA FI)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 10,
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - PDC (POST DATED CHEQUE)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 10,
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - PO (PAY ORDER)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 10,
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - STW (GST WITH HELD)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 10,
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - TCS (TRAVELER CHEQUES)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  top: 5,
                  right: 10,
                  bottom: 1,
                ),
                alignment: Alignment.topLeft,
                child: Text(' - TXC (TAX CHALLAN)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left),
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

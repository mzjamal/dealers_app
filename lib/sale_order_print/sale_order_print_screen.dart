import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';
import '../globals.dart';

class SaleOrderPrintScreen extends StatefulWidget {
  static const routeName = '/printOrder';

  @override
  _SaleOrderPrintScreenState createState() => _SaleOrderPrintScreenState();
}

class _SaleOrderPrintScreenState extends State<SaleOrderPrintScreen> {
  final _formKey = GlobalKey<FormState>();
  String _orderNumber = '';
  final String _urlOrder = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    //to close the keyboards opened for user inputs
    FocusScope.of(context).unfocus();

    if (isValid) {
      //this will call save methods on all input text fields
      _formKey.currentState.save();
      //print(_orderNumber);
      launch(_urlOrder + _orderNumber);
    }
  }

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
                  'Print Sales Order',
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
        height: MediaQuery.of(context).size.height,
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
          children: <Widget>[
            Container(
              color: Colors.amber.shade400,
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.only(
                top: 12,
                left: 10,
              ),
              child: Text(
                'WELCOME ' +
                    Globals.dealerName +
                    '  [' +
                    Globals.dealerCode +
                    ']',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 100,
              ),
              width: double.infinity,
              child: Text(
                'سیلز آرڈر پرنٹ کیلئے ، آرڈر نمبر درج کریں اور اوکے بٹن کو دبائیں',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.only(
                  top: 200,
                  left: 10,
                  right: 10,
                ),
                child: TextFormField(
                  key: ValueKey('ordernum'),
                  cursorColor: Colors.red,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter order number.';
                    }
                    if (value.length < 10) {
                      return 'Please enter valid order number.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Order Number'),
                  autofocus: true,
                  onSaved: (value) {
                    _orderNumber = value;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 400,
                left: 8,
                right: 8,
              ),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: Container(
                  color: Colors.amber.shade400,
                  child: TextButton.icon(
                    onPressed: _trySubmit,
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
          ],
        ),
      ),
    );
  }
}

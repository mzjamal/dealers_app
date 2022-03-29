import 'package:flutter/material.dart';
import './globals.dart';

class AboutApplication extends StatelessWidget {
  static const routeName = '/aboutHelp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ffc.png',
                      height: 40,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/sona.png',
                      height: 60,
                      width: 48,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                // Image.asset(
                //   'assets/images/ffc.png',
                //   height: 40,
                //   width: 120,
                //   fit: BoxFit.cover,
                // ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sona Dost',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                  textAlign: TextAlign.left,
                ),
                // SizedBox(
                //   height: 30,
                // ),
                // Text(
                //   'Sales District: ' + Globals.globalDesignation,
                //   textAlign: TextAlign.left,
                //   style: TextStyle(fontSize: 18),
                // ),
                SizedBox(
                  height: 30,
                ),
                const Text(
                  'Version 1.0.11',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'First Release: July, 2021',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Version 1.1.0 (April, 2022)',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'UUID: ' + Globals.deviceUUID,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Container(
                    color: Colors.amber.shade400,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

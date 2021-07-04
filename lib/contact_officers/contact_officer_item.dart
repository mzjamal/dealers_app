import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class ContactOffcierItem extends StatelessWidget {
  final String saleOfficerName;
  final String saleOfficerContact;
  final String saleOfficeEmail;
  final String agriOfficerName;
  final String agriOfficerContact;
  final String agriOfficeEmail;

  ContactOffcierItem({
    @required this.saleOfficerName,
    @required this.saleOfficerContact,
    @required this.saleOfficeEmail,
    @required this.agriOfficerName,
    @required this.agriOfficerContact,
    @required this.agriOfficeEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Card(
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 25,
                  //color: Colors.grey.shade200,
                  child: Text(
                    'Head of Sales District',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue.shade900),
                    textAlign: TextAlign.center,
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  //color: Colors.grey.shade200,
                  child: Text(
                    saleOfficerName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //color: Colors.grey.shade200,
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  //color: Colors.grey.shade200,
                  child: Text(
                    'Cell No: ' + saleOfficerContact,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  //color: Colors.grey.shade200,
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 25,
                  //color: Colors.grey.shade200,
                  child: Text(
                    'Email: ' + saleOfficeEmail,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     launch(('tel://${' ' + saleOfficerContact + ''}'));
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //     ),
                      //     height: 50,
                      //     width: 50,
                      //     child: Icon(
                      //       Icons.phone_in_talk_outlined,
                      //       color: Colors.green.shade500,
                      //       size: 50,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: 70,
                        width: 70,
                        child: TextButton.icon(
                          onPressed: () {
                            launch(('tel://${' ' + saleOfficerContact + ''}'));
                          },
                          icon: Icon(
                            Icons.phone_in_talk_outlined,
                            color: Colors.green.shade500,
                            size: 45,
                          ),
                          label: Text(''),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        child: TextButton.icon(
                          onPressed: () {
                            launch('sms:' +
                                saleOfficerContact +
                                ' ?body=${'Dear FFC Officer...'}');
                          },
                          icon: Icon(
                            Icons.sms_outlined,
                            color: Colors.indigo.shade500,
                            size: 45,
                          ),
                          label: Text(''),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     launch('sms:' +
                      //         saleOfficerContact +
                      //         ' ?body=${'Dear FFC Officer...'}');
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //     ),
                      //     height: 50,
                      //     width: 50,
                      //     child: Icon(
                      //       Icons.sms_outlined,
                      //       color: Colors.indigo.shade500,
                      //       size: 50,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        child: TextButton.icon(
                          onPressed: () {
                            launch(
                                ('mailto:${'' + saleOfficeEmail + ''}?subject=${'Sona Dost Mobile App'}&body=${'Please contact the undersigned for some information in SONA Dost mobile application.'}'));
                          },
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.amber.shade800,
                            size: 45,
                          ),
                          label: Text(''),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     launch(
                      //         ('mailto:${'' + saleOfficeEmail + ''}?subject=${'Sona Dealer Mobile App'}&body=${'Please contact the undersigned for some information in SONA Dealer mobile application.'}'));
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //     ),
                      //     height: 50,
                      //     width: 50,
                      //     child: Icon(
                      //       Icons.email_outlined,
                      //       color: Colors.amber.shade800,
                      //       size: 50,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            elevation: 10,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          child: Card(
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 25,
                  //color: Colors.grey.shade200,
                  child: Text(
                    'Agri Services Officer',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue.shade900),
                    textAlign: TextAlign.center,
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: Colors.grey.shade200,
                  child: Text(
                    agriOfficerName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  color: Colors.grey.shade200,
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  //color: Colors.grey.shade200,
                  child: Text(
                    'Cell No: ' + agriOfficerContact,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  color: Colors.grey.shade200,
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 5,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 25,
                  //color: Colors.grey.shade200,
                  child: Text(
                    'Email: ' + agriOfficeEmail,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     launch(('tel://${' ' + agriOfficerContact + ''}'));
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //     ),
                      //     height: 50,
                      //     width: 50,
                      //     child: Icon(
                      //       Icons.phone_in_talk_outlined,
                      //       color: Colors.green.shade500,
                      //       size: 50,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: 70,
                        width: 70,
                        child: TextButton.icon(
                          onPressed: () {
                            launch(('tel://${' ' + agriOfficerContact + ''}'));
                          },
                          icon: Icon(
                            Icons.phone_in_talk_outlined,
                            color: Colors.green.shade500,
                            size: 45,
                          ),
                          label: Text(''),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        child: TextButton.icon(
                          onPressed: () {
                            launch('sms:' +
                                agriOfficerContact +
                                ' ?body=${'Dear FFC Officer...'}');
                          },
                          icon: Icon(
                            Icons.sms_outlined,
                            color: Colors.indigo.shade500,
                            size: 45,
                          ),
                          label: Text(''),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     launch('sms:' +
                      //         agriOfficerContact +
                      //         ' ?body=${'Dear FFC Officer...'}');
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //     ),
                      //     height: 50,
                      //     width: 50,
                      //     child: Icon(
                      //       Icons.sms_outlined,
                      //       color: Colors.indigo.shade500,
                      //       size: 50,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        child: TextButton.icon(
                          onPressed: () {
                            launch(
                                ('mailto:${'' + agriOfficeEmail + ''}?subject=${'Sona Dost Mobile App'}&body=${'Please contact the undersigned for some information in SONA Dost mobile application.'}'));
                          },
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.amber.shade800,
                            size: 45,
                          ),
                          label: Text(''),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     launch(
                      //         ('mailto:${'' + agriOfficeEmail + ''}?subject=${'Sona Dost Mobile App'}&body=${'Please contact the undersigned regarding agri services related information.'}'));
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //     ),
                      //     height: 50,
                      //     width: 50,
                      //     child: Icon(
                      //       Icons.email_outlined,
                      //       color: Colors.amber.shade800,
                      //       size: 50,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            elevation: 10,
          ),
        ),
      ],
    );
  }
}

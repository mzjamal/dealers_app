import 'package:flutter/material.dart';

class PrivayPolicy extends StatelessWidget {
  static const routeName = '/privPolicy';

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
          child: SingleChildScrollView(
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
                    'Sona Dost Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
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
                    'Last updated: July 18, 2022',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Sona Dost mobile app contains ready to use sales and shipments related information for FFC customers. This Application collects device UUID from its Users.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Owner and Data Controller',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'FFC 156 The Mall Rawalpindi Pakistan \nEmail Contact: zahidjamal@gmail.com',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Type of Data Collected',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This Application collects device UUID (Universally unique identifier) for granting access to relevant inforamtion of the user. UUID requested by this Application is mandatory and failure to provide this will make it impossible for this Application to provide desired information to its users. Users who want to know further information about UUID and why it is mandatory are welcome to contact the Owner on his email or they can contact there concerned Head of Sales District.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '- The Owner takes appropriate security measures to prevent unauthorized access, disclosure, modification, or unauthorized destruction of the Data.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '- The Data processing is carried out strictly related to the purpose indicated.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '- This data is not shared with any third party.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '- The app does not contain ads.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'How UUID is used?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'UUID of the user device is collected to allow the Owner to grant access to app users on their relevant data. This app only provides read only access on informaiton to its users.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Retention time',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'UUID of the user shall be processed and stored for as long as required for the purpose for which this data has been collected for. UUID is stored once the user contacts with owner or his concerned Head of Sales District and share his device UUID with his consent to access the information using this app.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'How to Remove UUID from Owner Record?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If the user wants to remove his UUID, he can contact the owner on given email or by directly calling his Head of Sales District for this purpose.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Contact Us',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If app users have any questions about this Privacy Policy, they can contact us:',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '- By Calling Directly to Head of Sales District',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '- By email: zahidjamal@gmail.com',
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
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

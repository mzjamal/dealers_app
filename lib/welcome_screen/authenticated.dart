import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';

class Authenticated extends StatelessWidget {
  final _scrollController = ScrollController();
  final String userName;
  final String desig;

  Authenticated({
    @required this.userName,
    @required this.desig,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.blue.shade800),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            userName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.blue.shade800),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 5,
            ),
            child: Text(
              '[Disclaimer]',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Text(
                          'This mobile application has been developed for the sole purpose of facilitating our dealers in their business/financial transactions/matters with the Company. This mobile application has been developed, is owned and is run by the Fauji Fertilizer Company. The user’s access to this app is subject to the terms and conditions laid down in this disclaimer. The user is expected to have read this disclaimer before accessing the application. By agreeing to the terms and conditions of this application, the user has entered into an electronic contract as laid down in the Pakistan Electronic Transaction Ordinance, 2002. The user is bound to strictly adhere to the law of the land. The user is expected to exercise diligence and caution while using this application.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'By using this application and availing its services is in any way, the user is agreeing to comply with and be bound by all the rules laid down in the agreement. If you are unwilling to be bound by these rules in any way please do not use this application in any way.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Intellectual Property Rights',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Fauji Fertilizer Company is the sole owner of this application. The Company rightfully utilizes all property laws to protect the content of this application including the interface, design, graphics, images etc. All intellectual property rights in the mobile application will be retained by the Company. The user is in no way entitled to replicate, distribute, duplicate or commercially exploit the content of the application without explicitly written down permission granted by the company. Any infringement in the Company’s intellectual property is liable to be prosecuted under the law.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Privacy Policy',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The company asks users for information for the sole purpose of facilitating them and providing them services. Please ensure that you have duly read our privacy policy so that you understand how your information is treated. The user’s data is voluntarily given by the user for the purpose of utilizing better services for his fertilizer business. The data is given by consent of the user only. If you do not wish to give your data away through this mobile application you may choose to opt out. In the event that you are not comfortable sharing your data, please do not sign this electronic contract. By agreeing to the terms and conditions of the application and by using it the user has voluntarily given up any right to legally prosecute the owner of the application for any personal data or privacy infringements.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The user of this application by signing this agreement agrees that the onus of keeping his ID and password confidential is on him. The user is personally responsible for any and all activities that occur on his account. The company will not be responsible for any losses occurring due to any unauthorized access at any of the user’s accounts.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Effectiveness of Agreement Clause',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The agreement is effective at the time the user agrees to this disclaimer. At the time that the user agrees to the terms and conditions of this application and successfully logs into the application, the aforementioned terms and conditions will be binding.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Security Policy',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The user is strictly prohibited from infringing or attempting to infringe any security feature of this application. The user may not attempt to access data that is not intended for him. The user is strictly prohibited from accessing or attempting to access an account that he is not authorized to access. Any attempt to test breach the security system of this mobile application is also liable to prosecution under the law.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Limited Liability Clause',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'By signing this agreement, the user is unconditionally agreeing that he will not hold the company responsible for any financial losses or lost profits of any kind. By signing this agreement, the user acknowledges that the company also has indemnity against any lawsuit filed by the users in case of any failure at the bank’s end. The company also has no liability in case of a data privacy breach at the bank’s end. By signing this agreement, the user also voluntarilty gives up the right to bring up any lawsuit against the company in the case of any cyber-attack or malware attack.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'User Eligibility',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'User eligibility is contingent upon two factors. Firstly, the user should be a dealer of Fauji Fertilizer Company. Secondly, the user should be an adult over the age of 18 years.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Modifications in the agreement',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The user is expected to thoroughly read this disclaimer and be vigilant of any changes to the aforementioned. The company reserves the right to change the agreement when it deems necessary, with or without notice. The sole responsibility of regularly reviewing the agreement lies on the user.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Violation of agreement',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Any violation of this disclaimer will be liable to litigation. The company reserves the right to terminate the user’s account in case of any violation.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Right to limit or terminate access to application',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The company reserves the right to limit access to application or certain features of the application, whichever it deems necessary. The company reserves the right to terminate access to the application altogether without prior notice or intimation.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Limited Liability for the company',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'By signing the agreement, the user shall acknowledge that the company will not be responsible for any financial losses or lost profits of any kind. The user cannot file a lawsuit against the company if he is in any way incompetent to use the application or ay of its features. The user cannot hold the company liable in any form in the event that there of any cyberattack, malware or virus infiltration. The user cannot legally challenge the company due to any unforeseeable circumstance resulting in any financial loss or lost profit of any kind.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Legal indemnity for all internal stakeholders of the company',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The company, its directors, executives and all its employees enjoy full indemnity against litigation or proceedings of any sort pertinent to the application. By signing this disclaimer, the user is voluntarily and irreversibly giving up his right to bring about any form of lawsuit against all the internal stakeholders of the company.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Changes in Sale Orders',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The company exercises full right to change prices, stop sales or charge differentials at any time during the sale process. The company reserves full right in cancelling or changing sales orders when it deems necessary, without justification or intimation.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Right to Litigation in Case of Furnishing False Evidence or Infringing the Rights of Other Users',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'The company reserves the right to prosecute any user in the case that they furnish any sort of false evidence or counterfeit financial instruments. The company also has the right to prosecute any user in the case that they infringe the rights or compromise the data of other users.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '[End of Disclaimer Text]',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.amber,
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {
                  //Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushReplacementNamed(HomeTabsScreen.routeName);
                  //print(Globals.deviceHeight);
                  //print(Globals.deviceWidth);
                  /*print(
                      "Width = " + MediaQuery.of(context).size.width.toString());
                  print("Height = " +
                      MediaQuery.of(context).size.height.toString());
                  print("Device Pixel Ration = " +
                      MediaQuery.of(context).devicePixelRatio.toString());
                  if (MediaQuery.of(context).size < const Size(360.0, 640.0)) {
                    print("Not an S6 Edge");
                  } else {
                    print("Its S6 Edge");
                  }*/
                },
                icon: Icon(
                  Icons.done_outline_rounded,
                  color: Colors.black,
                  size: 30,
                ),
                label: Text(
                  'I agree to Terms and Conditions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          // Text(
          //   'Please agree to continue.',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 18, color: Colors.black),
          // ),
        ],
      ),
    );
  }
}

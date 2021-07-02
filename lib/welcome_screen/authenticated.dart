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
            style: TextStyle(
              fontSize: 22,
              color: Colors.blue.shade800,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.only(
          //     left: 5,
          //   ),
          //   child: Text(
          //     '[Disclaimer]',
          //     textAlign: TextAlign.start,
          //     style: TextStyle(fontSize: 18, color: Colors.black),
          //   ),
          // ),
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
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '[Sona Dost Disclaimer]',
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
                          'This mobile application has been developed for the sole purpose of facilitating our dealers in their businesses and providing dealers valuable information related to Fertilizers and Agri services. This mobile application has been developed, is owned and is run by the Fauji Fertilizer Company Ltd. The user’s access to this app is subject to the terms and conditions laid down in this disclaimer. ',
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
                          'By using this application and availing its services is in any way, the user is agreeing to comply with and be bound by all the rules laid down in the agreement. If you are unwilling to be bound by these rules in any way whatsoever, please do not use this application in any way.',
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
                          'Fauji Fertilizer Company is the sole owner of this application. The company rightfully utilizes all property laws to protect the content of this application including the interface, design, graphics, Agri services literature, images etc. All intellectual property rights in the mobile application will be retained by the company. The user is in no way entitled to replicate, distribute, duplicate or commercially exploit the content of the application without explicitly written down permission granted by the company.',
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
                          'The company asks users for information for the sole purpose of facilitating them and providing them services. In the event that you are not comfortable sharing your data, please do not sign this electronic contract.',
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
                          'The onus of keeping ID and password confidential is on the user. In the event that user information is compromised in any way, the onus of informing the company is on the user. The company will be in no way responsible for any lost profits or financial losses occurring due to compromise in user data.',
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
                          'By signing this agreement, the user is unconditionally agreeing that he will not hold the company responsible for any financial losses or lost profits of any kind. By signing this agreement, the user acknowledges that the company also has indemnity against any lawsuit filed by the users in case of any technical failure. The company also has no liability in the event that the password is rendered compromised in any way, responsibility of maintaining confidentiality of password rests on the user. By signing this agreement, the user also voluntarilty gives up the right to bring up any lawsuit against the company in the case of any cyber-attack, virus infiltration or malware attack etc. The user cannot legally challenge the company due to any unforeseeable circumstance resulting in any financial loss or lost profit of any kind. The company, its directors, executives and all its employees enjoy full indemnity against litigation or proceedings of any sort pertinent to the application. By signing this disclaimer, the user is voluntarily and irreversibly giving up his right to bring about any form of lawsuit against all the internal stakeholders of the company.',
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
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            //padding: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black45,
                    offset: Offset(2, 2),
                    blurRadius: 1,
                    spreadRadius: 1)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xfffbb448), Color(0xfff7892b)]),
            ),
            child: TextButton.icon(
              onPressed: () {
                //Navigator.of(context).pop();
                Navigator.of(context)
                    .pushReplacementNamed(HomeTabsScreen.routeName);
              },
              icon: Icon(
                Icons.done_outline_rounded,
                color: Colors.black,
                size: 20,
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

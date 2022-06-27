import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './tax_screen_item.dart';

class TaxFfblScreen extends StatefulWidget {
  static const routeName = '/taxFfblScrn';

  @override
  State<TaxFfblScreen> createState() => _TaxFfblScreenState();
}

class _TaxFfblScreenState extends State<TaxFfblScreen> {
  var _isInit = true;
  List<TaxScreenItem> ogItems = [];
  //NumberFormat format = NumberFormat('#,###,###,###.00');

  // final String url =
  //     'https://ffcportal.ffc.com.pk:8856/sap/opu/odata/sap/ZTSALE_SRV/ZTSale?sap-client=500&\$format=json';

  final String url =
      'https://ffcportal.ffc.com.pk:8853/sap/opu/odata/sap/ZVASSTAXCERT_SRV/ZVASSTaxCert?sap-client=200&\$filter=COMP eq \'' +
          'FFBL' +
          '\'&\$format=json';
  @override
  void initState() {
    //print('Inside initstate method.');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //print('Inside didChangeDependencies');
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<List<TaxScreenItem>> _getJsonData() async {
    //final username = Globals.serviceUserName;
    //final password = Globals.servicePass;
    final username = 'zjamal';
    final password = 'Helloall@123';
    final credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
    };

    try {
      var response = await http.get(url, headers: headers);

      var jsonData = json.decode(response.body) as Map<String, dynamic>;

      var vdata = jsonData['d'];
      var xdata = vdata['results'] as List;

      xdata.forEach((element) {
        // if (element['VKGRP'] == Globals.globalSalesDist) {
        TaxScreenItem ogItem = TaxScreenItem(
          element['COMP'],
          element['VALID'],
          element['LINK'],
        );

        ogItems.add(ogItem);
        // }
      });
    } catch (error) {
      //print(error);
    }
    if (ogItems.isEmpty) {
      TaxScreenItem ogItemNew = TaxScreenItem(
        '',
        'No Data',
        '',
      );
      ogItems.add(ogItemNew);
    }
    // //sort the list on dealer name
    // saleItems.sort((a, b) => a.dealerName.compareTo(b.dealerName));
    return ogItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.orange.shade100,
              Colors.green.shade100,
              Colors.blue.shade200
            ])),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: ListView(
                children: [
                  FutureBuilder(
                    future: _getJsonData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Container(
                          height: 500,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.amber,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'FFBL Tax Exemption Certificates',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'ٹیکس استثنیٰ سرٹیفکیٹ',
                                style: TextStyle(
                                  fontSize: 24,
                                  //fontWeight: FontWeight.bold,
                                  fontFamily: 'Urdu',
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ...ogItems,
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Income tax withholding obligation under Section 153 of the Income Tax Ordinance 2001',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '1. No tax withholding is required on transactions relating to imported products - “FFC DAP”, “FFC SOP (G)”, “FFC MOP”, “SONA BORON” and “SONA ZINC (G)” in accordance with Section 153(5)(a) and Clause 47A of Part IV of the Second Schedule to the Income Tax Ordinance 2001 (the Ordinance), as income tax under section 148 of the Ordinance is paid at import stage by FFC.',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '2. Only withholding agents prescribed under the law are obligated to withhold income tax under Section 153 of the Ordinance. An individual or association of persons, having turnover (total turnover from all businesses) of one hundred million rupees or above in any of the preceding tax years is prescribed as withholding agent. Customers having lower turnover are not required to withhold income tax under the Ordinance.',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

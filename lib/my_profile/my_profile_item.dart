import 'package:flutter/material.dart';
import '../globals.dart';

class MyProfileItem extends StatelessWidget {
  final String salesZone;
  final String salesRegion;
  final String salesDist;
  final String dealerCode;
  final String dealerName;
  final String address;
  final String contactNumber;
  final String proprietorName;
  final String setUpDate;
  final String salePointCode;
  final String salePointDesc;
  final String cnicNo;
  final String filerStatus;
  final String gstRegStatus;
  final String ntnNo;
  final String strnNo;
  final String contactPerson;
  final String contactPerCell;

  MyProfileItem({
    @required this.salesZone,
    @required this.salesRegion,
    @required this.salesDist,
    @required this.dealerCode,
    @required this.dealerName,
    @required this.address,
    @required this.contactNumber,
    @required this.proprietorName,
    @required this.setUpDate,
    @required this.salePointCode,
    @required this.salePointDesc,
    @required this.cnicNo,
    @required this.filerStatus,
    @required this.gstRegStatus,
    @required this.ntnNo,
    @required this.strnNo,
    @required this.contactPerson,
    @required this.contactPerCell,
  });

  String _salesZone(String salesZone) {
    if (salesZone == '10000') {
      return '10000 - North';
    }
    if (salesZone == '20000') {
      return '20000 - Center';
    }
    if (salesZone == '30000') {
      return '30000 - South';
    } else {
      return '';
    }
  }

  String _salesRegion(String regionCode) {
    if (regionCode == '1100') {
      return regionCode + ' - ' + 'Lahore';
    }
    if (regionCode == '1200') {
      return regionCode + ' - ' + 'Faisalabad';
    }
    if (regionCode == '1300') {
      return regionCode + ' - ' + 'Sahiwal';
    }
    if (regionCode == '1600') {
      return regionCode + ' - ' + 'Sargodha';
    }
    if (regionCode == '2100') {
      return regionCode + ' - ' + 'Peshawar';
    }
    if (regionCode == '1400') {
      return regionCode + ' - ' + 'Multan';
    }
    if (regionCode == '1500') {
      return regionCode + ' - ' + 'Bahawalpur';
    }
    if (regionCode == '1700') {
      return regionCode + ' - ' + 'Vehari';
    }
    if (regionCode == '1800') {
      return regionCode + ' - ' + 'D.G. Khan';
    }
    if (regionCode == '1900') {
      return regionCode + ' - ' + 'R.Y. Khan';
    }
    if (regionCode == '3100') {
      return regionCode + ' - ' + 'Hyderabad';
    }
    if (regionCode == '3200') {
      return regionCode + ' - ' + 'Sukkur';
    }
    if (regionCode == '3300') {
      return regionCode + ' - ' + 'Nawabshah';
    } else {
      return regionCode;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'DEALER NAME',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                dealerName,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'DEALER CODE',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                dealerCode,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'SET UP DATE',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                setUpDate == '' ? 'N/A' : setUpDate,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'PROPRIETOR',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                proprietorName == '' ? 'N/A' : proprietorName,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'DEALER CONTACT NUMBER',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                contactNumber == '' ? 'N/A' : contactNumber,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'CONTACT PERSON',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                contactPerson == '' ? 'N/A' : contactPerson,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'CONTACT PERSON CELL NUMBER',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                contactPerCell == '' ? 'N/A' : contactPerCell,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'CNIC NUMBER',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                cnicNo == '' ? 'N/A' : cnicNo,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'INCOME TAX FILER STATUS',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                filerStatus == '' ? 'N/A' : filerStatus,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'NTN INFO',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                ntnNo == '' ? 'N/A' : ntnNo,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'GST REGISTRATION STATUS',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                gstRegStatus == '' ? 'N/A' : gstRegStatus,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'STRN INFO',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                strnNo == '' ? 'N/A' : strnNo,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'SALE POINT',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                salePointCode == ''
                    ? 'N/A'
                    : salePointCode + ' - ' + salePointDesc,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'ADDRESS',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.topLeft,
              height: 100,
              width: double.infinity,
              child: Text(
                address,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                softWrap: true,
              ),
            ),
            // SizedBox(
            //   height: 1,
            // ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'SALES DISTRICT',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                salesDist + ' - ' + Globals.globalDesignation,
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                'REGION',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                _salesRegion(salesRegion),
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),

            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 25,
              width: double.infinity,
              child: Text(
                'ZONE',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Text(
                _salesZone(salesZone),
                style: TextStyle(fontSize: 24),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ],
    );
  }
}

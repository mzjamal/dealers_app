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

  String _salesDist(String distCode) {
    if (distCode == 'LHR') {
      return 'Lahore';
    }
    if (distCode == 'GUJ') {
      return 'Gujranwala';
    }
    if (distCode == 'SHP') {
      return 'Sheikhupura';
    }
    if (distCode == 'HAF') {
      return 'Hafizabad';
    }
    if (distCode == 'KAS') {
      return 'Kasur';
    }
    if (distCode == 'SKT') {
      return 'Sialkot';
    }
    if (distCode == 'FSL') {
      return 'Faisalabad';
    }
    if (distCode == 'JHG') {
      return 'Jhang';
    }
    if (distCode == 'TTS') {
      return 'Toba Tek Singh';
    }
    if (distCode == 'JRW') {
      return 'Jaranwala';
    }
    if (distCode == 'CHT') {
      return 'Chiniot';
    }
    if (distCode == 'SHW') {
      return 'Sahiwal';
    }
    if (distCode == 'PKP') {
      return 'Pakpattan';
    }
    if (distCode == 'OKR') {
      return 'Okara';
    }
    if (distCode == 'CHW') {
      return 'Chichawatni';
    }
    if (distCode == 'SRG') {
      return 'Sargodha';
    }
    if (distCode == 'MIW') {
      return 'Mianwali';
    }
    if (distCode == 'MBD') {
      return 'Mandi Bahaudddin';
    }
    if (distCode == 'RWP') {
      return 'Rawalpindi';
    }
    if (distCode == 'BHK') {
      return 'Bhakkar';
    }
    if (distCode == 'PSW') {
      return 'Peshawar';
    }
    if (distCode == 'ABT') {
      return 'Abbotabad';
    }
    if (distCode == 'MRD') {
      return 'Mardan';
    }
    if (distCode == 'DIK') {
      return 'D.I.Khan';
    }
    if (distCode == 'MNG') {
      return 'Mingora';
    }
    if (distCode == 'MUL') {
      return 'Multan';
    }
    if (distCode == 'MZG') {
      return 'Muzafargarh';
    }
    if (distCode == 'LDR') {
      return 'Lodhran';
    }
    if (distCode == 'SHJ') {
      return 'Shujabad';
    }
    if (distCode == 'BWP') {
      return 'Bahawalpur';
    }
    if (distCode == 'HSP') {
      return 'Hasilpur';
    }
    if (distCode == 'BWN') {
      return 'Bahawalnagar';
    }
    if (distCode == 'HRN') {
      return 'Haroonabad';
    }
    if (distCode == 'VHR') {
      return 'Vehari';
    }
    if (distCode == 'MCN') {
      return 'Mian Channu';
    }
    if (distCode == 'MLS') {
      return 'Mailsi';
    }
    if (distCode == 'KWL') {
      return 'Khanewal';
    }
    if (distCode == 'DGK') {
      return 'D. G. Khan';
    }
    if (distCode == 'RJN') {
      return 'Rajanpur';
    }
    if (distCode == 'LYH') {
      return 'Layyah';
    }
    if (distCode == 'KAD') {
      return 'Kot Addu';
    }
    if (distCode == 'RYK') {
      return 'R.Y. Khan';
    }
    if (distCode == 'SDQ') {
      return 'Sadiqabad';
    }
    if (distCode == 'KNP') {
      return 'Khanpur';
    }
    if (distCode == 'APE') {
      return 'A.P.East';
    }
    if (distCode == 'HY1') {
      return 'Hyderabad I';
    }
    if (distCode == 'HY2') {
      return 'Hyderabad II';
    }
    if (distCode == 'KHI') {
      return 'Karachi';
    }
    if (distCode == 'MPK') {
      return 'Mirpur Khas';
    }
    if (distCode == 'BDN') {
      return 'Badin';
    }
    if (distCode == 'DGR') {
      return 'Digri';
    }
    if (distCode == 'SKR') {
      return 'Sukkur';
    }
    if (distCode == 'LKN') {
      return 'Larkana';
    }
    if (distCode == 'KHP') {
      return 'Khairpur';
    }
    if (distCode == 'JCB') {
      return 'Jacobabad';
    }
    if (distCode == 'DRK') {
      return 'Dharki';
    }
    if (distCode == 'QTA') {
      return 'Quetta';
    }
    if (distCode == 'DAY') {
      return 'Dera Allah Yar';
    }
    if (distCode == 'NWS') {
      return 'Nawabshah';
    }
    if (distCode == 'SGR') {
      return 'Sanghar';
    }
    if (distCode == 'NSF') {
      return 'Naushahro Feroze';
    }
    if (distCode == 'SDP') {
      return 'Shahdadpur';
    }
    if (distCode == 'DDU') {
      return 'Dadu';
    } else {
      return distCode;
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
                salesDist + ' - ' + _salesDist(salesDist),
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

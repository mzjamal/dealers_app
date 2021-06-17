import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PreviousYearSaleItem extends StatelessWidget {
  final String dealerCode;
  final String sonaPmsale;
  final String sonaPysale;
  final String sonaGmsale;
  final String sonaGysale;
  final String sonaDapmsale;
  final String sonaDapysale;
  final String ffcDapmsale;
  final String ffcDapysale;
  final String sopMsale;
  final String sopYsale;
  final String mopMsale;
  final String mopYsale;
  final String zincMsale;
  final String zincYsale;
  final String boronMsale;
  final String boronYsale;
  final NumberFormat formatSale = NumberFormat('#,###,###,###.###');

  PreviousYearSaleItem({
    this.dealerCode,
    this.sonaPmsale,
    this.sonaPysale,
    this.sonaGmsale,
    this.sonaGysale,
    this.sonaDapmsale,
    this.sonaDapysale,
    this.ffcDapmsale,
    this.ffcDapysale,
    this.sopMsale,
    this.sopYsale,
    this.mopMsale,
    this.mopYsale,
    this.zincMsale,
    this.zincYsale,
    this.boronMsale,
    this.boronYsale,
  });

  String _thousandSeprator(String value) {
    var intValue = double.parse(value);
    var returnValue = formatSale.format(intValue);
    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        //color: Colors.yellow.shade100,
        color: Colors.indigo.shade50,
        // shape: RoundedRectangleBorder(
        //     side: BorderSide.none, borderRadius: BorderRadius.zero),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(0),
        // ),
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    'Sona Urea (P)',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.2,
                //   child: Text(
                //     _thousandSeprator(sonaPmsale),
                //     textAlign: TextAlign.right,
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 1,
                //     softWrap: true,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Text(
                    _thousandSeprator(sonaPysale),
                    //sonaPysale,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    'Sona Urea (G)',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.2,
                //   child: Text(
                //     _thousandSeprator(sonaGmsale),
                //     textAlign: TextAlign.right,
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 1,
                //     softWrap: true,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(sonaGysale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            //new produ
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    'Sona DAP',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.2,
                //   child: Text(
                //     _thousandSeprator(sonaDapmsale),
                //     textAlign: TextAlign.right,
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 1,
                //     softWrap: true,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(sonaDapysale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    'FFC DAP',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.2,
                //   child: Text(
                //     _thousandSeprator(ffcDapmsale),
                //     textAlign: TextAlign.right,
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 1,
                //     softWrap: true,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(ffcDapysale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    'FFC SOP',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.2,
                //   child: Text(
                //     _thousandSeprator(sopMsale),
                //     textAlign: TextAlign.right,
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 1,
                //     softWrap: true,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(sopYsale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    'FFC MOP',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.2,
                //   child: Text(
                //     _thousandSeprator(mopMsale),
                //     textAlign: TextAlign.right,
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 1,
                //     softWrap: true,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(mopYsale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    'Sona Zinc',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.2,
                //   child: Text(
                //     _thousandSeprator(zincMsale),
                //     textAlign: TextAlign.right,
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 1,
                //     softWrap: true,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(zincYsale),
                    //zincYsale,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    'Sona Boron',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width * 0.2,
                //   child: Text(
                //     _thousandSeprator(boronMsale),
                //     textAlign: TextAlign.right,
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     overflow: TextOverflow.ellipsis,
                //     maxLines: 1,
                //     softWrap: true,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(boronYsale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

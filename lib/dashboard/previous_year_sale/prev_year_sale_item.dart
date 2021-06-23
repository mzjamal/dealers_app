import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PreviousYearSaleItem extends StatelessWidget {
  final String dealerCode;
  final String sonaPysale;
  final String sonaGysale;
  final String sonaDapysale;
  final String ffcDapysale;
  final String sopYsale;
  final String mopYsale;
  final String zincYsale;
  final String boronYsale;
  final String sonaPysaleDate;
  final String sonaGysaleDate;
  final String sonaDapysaleDate;
  final String ffcDapysaleDate;
  final String sopYsaleDate;
  final String mopYsaleDate;
  final String zincYsaleDate;
  final String boronYsaleDate;
  final NumberFormat formatSale = NumberFormat('#,###,###,###.###');

  PreviousYearSaleItem({
    this.dealerCode,
    this.sonaPysale,
    this.sonaGysale,
    this.sonaDapysale,
    this.ffcDapysale,
    this.sopYsale,
    this.mopYsale,
    this.zincYsale,
    this.boronYsale,
    this.sonaPysaleDate,
    this.sonaGysaleDate,
    this.sonaDapysaleDate,
    this.ffcDapysaleDate,
    this.sopYsaleDate,
    this.mopYsaleDate,
    this.zincYsaleDate,
    this.boronYsaleDate,
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    _thousandSeprator(sonaPysaleDate),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: Text(
                    _thousandSeprator(sonaPysale),
                    //sonaPysale,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    _thousandSeprator(sonaGysaleDate),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(sonaGysale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    _thousandSeprator(sonaDapysaleDate),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(sonaDapysale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    _thousandSeprator(ffcDapysaleDate),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(ffcDapysale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    _thousandSeprator(sopYsaleDate),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(sopYsale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    _thousandSeprator(mopYsaleDate),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(mopYsale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    _thousandSeprator(zincYsaleDate),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(zincYsale),
                    //zincYsale,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    _thousandSeprator(boronYsaleDate),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    _thousandSeprator(boronYsale),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

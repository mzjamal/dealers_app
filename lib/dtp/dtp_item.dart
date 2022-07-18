import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DTPItem extends StatelessWidget {
  final String prodName;
  final String applicalbeDate;
  final String dtp;
  final double taxRate;
  final NumberFormat formatDtp = NumberFormat('#,###,###,###.###');

  DTPItem({
    @required this.prodName,
    @required this.applicalbeDate,
    @required this.dtp,
    @required this.taxRate,
  });

  String _dtpForDealer(String dtp) {
    var vDtp = double.parse(dtp) + (double.parse(dtp) * taxRate / 100);
    var returnValue = formatDtp.format(vDtp);
    return returnValue;
  }

  String _productName(String product) {
    if (product == 'Sona Urea (G)') {
      return 'Sona Urea (G) 50KG';
    } else if (product == 'Sona DAP') {
      return 'Sona DAP 50KG';
    } else if (product == 'FFC DAP') {
      return 'FFC DAP 50KG';
    } else if (product == 'FFC MOP') {
      return 'FFC MOP 50KG';
    } else if (product == 'Sona Zinc') {
      return 'Sona Zinc 3KG';
    } else if (product == 'Sona Boron') {
      return 'Sona Boron 3KG';
    } else if (product == 'FFC SOP (G)') {
      return 'FFC SOP (G) 50KG';
    } else {
      return product;
    }
  }

  // String _dtpForNonFiler(String dtp) {
  //   var vDtp = double.parse(dtp) * 1.014;
  //   var returnValue = formatDtp.format(vDtp);
  //   return returnValue;
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _productName(prodName),
                        style: TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    applicalbeDate,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                // Container(
                //   alignment: Alignment.centerRight,
                //   height: 35,
                //   width: 70,
                //   child: Text(
                //     dtp.toString(),
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //   ),
                // ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _dtpForDealer(dtp),
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   alignment: Alignment.centerRight,
                //   height: 25,
                //   width: MediaQuery.of(context).size.width * 0.5,
                //   child: Text(
                //     'Non Filer: ' + _dtpForNonFiler(dtp),
                //     style: TextStyle(fontSize: 16),
                //   ),
                // ),
                // Container(
                //   alignment: Alignment.centerRight,
                //   height: 35,
                //   width: 70,
                //   child: Text(
                //     dtp.toString(),
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

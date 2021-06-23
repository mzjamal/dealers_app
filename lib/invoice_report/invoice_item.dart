import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoiceItem extends StatelessWidget {
  final String invoiceNo;
  final String invDate;
  final String qty;
  final String product;
  final String plant;
  final NumberFormat formatDtp = NumberFormat('#,###,###,###.##');

  InvoiceItem({
    @required this.invoiceNo,
    @required this.invDate,
    @required this.qty,
    @required this.product,
    @required this.plant,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.grey.shade100,
        //color: Color(0xffb74093),
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
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Invoice No: ' + invoiceNo,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Text(
                    'Date: ' + invDate,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
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
                        'Product: ' + product,
                        style: TextStyle(
                          fontSize: 14,
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
                    'Qty: ' + qty,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Plant/Port/Warehouse: ' + plant,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaleOrderItem extends StatelessWidget {
  final String orderNo;
  final String orderDate;
  final String qty;
  final String product;
  final String plant;
  final String isShipped;
  final NumberFormat formatDtp = NumberFormat('#,###,###,###.##');

  SaleOrderItem({
    @required this.orderNo,
    @required this.orderDate,
    @required this.qty,
    @required this.product,
    @required this.plant,
    @required this.isShipped,
  });

  Color _fontColor() {
    if (isShipped == 'Yes') {
      return Colors.blue.shade800;
    }
    return Colors.black;
  }

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
                        'Order No: ' + orderNo,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _fontColor(),
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
                    'Date: ' + orderDate,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _fontColor(),
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
                          fontSize: 16,
                          color: _fontColor(),
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
                    style: TextStyle(
                      fontSize: 16,
                      color: _fontColor(),
                    ),
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
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Plant / Warehouse: ' + plant,
                        style: TextStyle(
                          fontSize: 16,
                          color: _fontColor(),
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   alignment: Alignment.centerRight,
                //   height: 25,
                //   width: MediaQuery.of(context).size.width * 0.25,
                //   child: Text(
                //     'Qty: ' + qty,
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

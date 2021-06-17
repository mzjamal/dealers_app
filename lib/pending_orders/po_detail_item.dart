import 'package:flutter/material.dart';

class PendingOrderDetailItem extends StatelessWidget {
  final String dealerCode;
  final String dealerName;
  final String orderNum;
  final String orderDate;
  final String prodSrl;
  final String prodName;
  final int pendingQTy;
  final int orderQty;
  final int deliverdQty;

  PendingOrderDetailItem({
    this.dealerCode,
    this.dealerName,
    this.orderNum,
    this.orderDate,
    this.prodSrl,
    this.prodName,
    this.pendingQTy,
    this.orderQty,
    this.deliverdQty,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Container(
            //       alignment: Alignment.centerLeft,
            //       height: 30,
            //       width: MediaQuery.of(context).size.width * 0.3,
            //       child: Container(
            //         padding: EdgeInsets.only(
            //           left: 10,
            //         ),
            //         alignment: Alignment.centerLeft,
            //         child: Text(
            //           dealerCode,
            //           style: TextStyle(
            //             fontSize: 16,
            //           ),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       alignment: Alignment.centerLeft,
            //       height: 30,
            //       width: MediaQuery.of(context).size.width * 0.6,
            //       child: Text(
            //         dealerName,
            //         style: TextStyle(fontSize: 16),
            //         overflow: TextOverflow.ellipsis,
            //         maxLines: 1,
            //         softWrap: true,
            //       ),
            //     ),
            //   ],
            // ),
            // Container(
            //   height: 20,
            //   padding: EdgeInsets.only(
            //     left: 10,
            //   ),
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Order Detail',
            //     style: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Row(
              children: [
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Order No.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Product',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.24,
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Pend. Qty',
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
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        orderNum,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    orderDate,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    prodName,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    pendingQTy.toString(),
                    style: TextStyle(fontSize: 16),
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

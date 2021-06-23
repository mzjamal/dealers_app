import 'package:flutter/material.dart';

class InvoiceNotiDispItem extends StatelessWidget {
  final String invoiceNo;
  final String billDate;
  final String readDate;
  final String notif;

  InvoiceNotiDispItem({
    @required this.invoiceNo,
    @required this.billDate,
    @required this.readDate,
    @required this.notif,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        //color: Colors.white70,
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
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Invoice No: ' + invoiceNo,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Notification Issue Date: ' + billDate,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
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
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Read Date: ' + readDate,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Container(
            //       alignment: Alignment.center,
            //       height: 15,
            //       width: MediaQuery.of(context).size.width * 0.65,
            //       child: Padding(
            //         padding: const EdgeInsets.only(
            //           left: 10,
            //           top: 10,
            //           bottom: 10,
            //         ),
            //         child: Container(
            //           alignment: Alignment.centerLeft,
            //           child: Text(
            //             'Notification',
            //             style: TextStyle(
            //               fontSize: 18,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.88,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        notif,
                        style: TextStyle(
                          fontSize: 20,
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

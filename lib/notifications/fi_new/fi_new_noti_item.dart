import 'package:flutter/material.dart';

class FiNewNotificationItem extends StatelessWidget {
  final String rowID;
  final String dealer;
  final String fiNumber;
  final String sysFiNumber;
  final String fiStatus;
  final String fiType;
  final String bankDocDate;
  final String fiDate;
  final String bank;
  final String docAmt;
  final String readDate;
  final String recType;

  FiNewNotificationItem({
    @required this.rowID,
    @required this.dealer,
    @required this.fiNumber,
    @required this.sysFiNumber,
    @required this.fiStatus,
    @required this.fiType,
    @required this.bankDocDate,
    @required this.fiDate,
    @required this.bank,
    @required this.docAmt,
    @required this.readDate,
    @required this.recType,
  });

  Color _fontColor() {
    if (recType == 'NEW') {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  String _notifText() {
    if (fiType == 'OFT' || fiType == 'OTC') {
      return 'Your Online Funds Transfer (OFT) for Rs. ' +
          docAmt +
          ' through ' +
          bank +
          ' successfully received on ' +
          fiDate +
          ' for cash sales order (subject to validation)';
    } else if (fiType == 'ICRC') {
      return 'Your Online Funds Transfer (OFT) for Rs. ' +
          docAmt +
          ' through ' +
          bank +
          ' successfully received on ' +
          fiDate +
          ' for sales order clearing (subject to validation)';
    } else {
      return 'Your ' +
          fiType +
          ' number ' +
          fiNumber +
          ', Bank ' +
          bank +
          ' of ' +
          bankDocDate +
          ', Amount Rs. ' +
          docAmt +
          ' has been physically received at warehouse. Disclaimer: Amounts are subject to verification by Bank';
    }
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        rowID,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _fontColor(),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 10,
                  ),
                  alignment: Alignment.centerRight,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    'Read: ' + readDate,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
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
                  alignment: Alignment.topCenter,
                  height: 110,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _notifText(),
                        style: TextStyle(
                          fontSize: 18,
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
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _fontColor(),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 10,
                  ),
                  alignment: Alignment.centerRight,
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    'Issued: ' + fiDate,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
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

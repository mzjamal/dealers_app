import 'package:flutter/material.dart';

class InvoicesNotificationItem extends StatelessWidget {
  final String rowID;
  final String dealer;
  final String invNumber;
  final String billingDate;
  final String cancelDate;
  final String invQty;
  final String whPlant;
  final String whPlantName;
  final String prod;
  final String readDate;
  final String recType;

  InvoicesNotificationItem({
    @required this.rowID,
    @required this.dealer,
    @required this.invNumber,
    @required this.billingDate,
    @required this.cancelDate,
    @required this.invQty,
    @required this.whPlant,
    @required this.whPlantName,
    @required this.prod,
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
                  height: 90,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Invoice No. ' +
                            invNumber +
                            ' cancelled on ' +
                            cancelDate +
                            ' of ' +
                            invQty +
                            ' MT ' +
                            prod +
                            ' from ' +
                            whPlant +
                            ' ' +
                            whPlantName,
                        style: TextStyle(
                          fontSize: 18,
                          color: _fontColor(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 15,
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
                    'Issued: ' + billingDate,
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

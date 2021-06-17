import 'package:flutter/material.dart';
//import '../colors.dart';
import './po_detail_table.dart';

class PendingOrderItem extends StatelessWidget {
  final int prodSrl;
  final String prodName;
  final String pendingPlant;
  final String pendingWh;
  final String pendingTotal;

  PendingOrderItem({
    this.prodSrl,
    this.prodName,
    this.pendingPlant,
    this.pendingWh,
    this.pendingTotal,
  });

  void _selectedProduct(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(PendingOrdersDetail.routeName, arguments: {
      'prodName': prodName,
      'pendingTotal': pendingTotal,
    });
    //print(dealerCode + dealerName);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedProduct(context),
      child: Card(
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 55,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    prodName,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 35,
              width: MediaQuery.of(context).size.width * 0.18,
              child: Text(
                pendingPlant,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 35,
              width: MediaQuery.of(context).size.width * 0.22,
              child: Text(
                pendingWh,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 35,
              width: MediaQuery.of(context).size.width * 0.22,
              child: Text(
                pendingTotal,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

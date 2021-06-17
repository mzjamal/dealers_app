import 'package:flutter/material.dart';

class CashCreditRatioItem extends StatelessWidget {
  final String dealer;
  final String cashSale;
  final String creditSale;
  final String cashCrdRatios;

  CashCreditRatioItem({
    @required this.dealer,
    @required this.cashSale,
    @required this.creditSale,
    @required this.cashCrdRatios,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 40,
              width: double.infinity,
              child: Text(
                'CASH SALE (MT)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 50,
              width: double.infinity,
              child: Text(
                cashSale,
                style: TextStyle(fontSize: 44),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 40,
              width: double.infinity,
              child: Text(
                'CREDIT SALE (MT)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 50,
              width: double.infinity,
              child: Text(
                creditSale,
                style: TextStyle(fontSize: 44),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 40,
              width: double.infinity,
              child: Text(
                'CASH CREDIT RATIOS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: 50,
              width: double.infinity,
              child: Text(
                cashCrdRatios,
                style: TextStyle(fontSize: 44),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

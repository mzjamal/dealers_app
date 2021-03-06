import 'package:flutter/material.dart';

class AccountBalanceItem extends StatelessWidget {
  final String dealerCode;
  final String fiType;
  final String fiNumber;
  final String bank;
  final String fiDate;
  final String balance;

  AccountBalanceItem({
    this.dealerCode,
    this.fiType,
    this.fiNumber,
    this.bank,
    this.fiDate,
    this.balance,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        //margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.14,
                  child: Text(
                    fiType,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: Text(
                    fiDate,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: Text(
                    fiNumber,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    // overflow: TextOverflow.ellipsis,
                    // maxLines: 1,
                    // softWrap: true,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    balance,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
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

import 'package:flutter/material.dart';
import '../pending_orders/po_summary_screen.dart';
import '../account_balance/account_balance_screen.dart';
import '../dealer_sale_profile/dealer_sale_screen.dart';
import '../dashboard/month_sales/month_sales_screen.dart';
import '../dashboard/orders_30_days/orders_30_screen.dart';
import '../dashboard/orders_60_days/orders_60_screen.dart';
import '../dashboard/previous_year_sale/prev_year_sale_screen.dart';
import '../cash_credit_ratios/cash_credit_ratios_screen.dart';

class DashboardTilesItem extends StatelessWidget {
  final int id;
  final String title;
  final String subTitle;
  final String unit;

  const DashboardTilesItem({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    @required this.unit,
  });

  void _displayScreen(BuildContext ctx, int tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 1) {
      Navigator.of(ctx).pushNamed(PendingOrderSummaryScreen.routeName);
    }
    if (tileID == 2) {
      Navigator.of(ctx).pushNamed(AccountBalanceScreen.routeName);
    }
    if (tileID == 3) {
      Navigator.of(ctx).pushNamed(OrdersLast30DaysScreen.routeName);
    }
    if (tileID == 4) {
      Navigator.of(ctx).pushNamed(OrdersLast60DaysScreen.routeName);
    }
    if (tileID == 5) {
      Navigator.of(ctx).pushNamed(DealerSaleScreen.routeName);
    }
    if (tileID == 6) {
      Navigator.of(ctx).pushNamed(PreviousYearSaleScreen.routeName);
    }
    if (tileID == 7) {
      Navigator.of(ctx).pushNamed(MonthSalesScreen.routeName);
    }
    if (tileID == 8) {
      Navigator.of(ctx).pushNamed(CashCreditRatiosScreen.routeName);
    }
  }

  double _fontSize(String _subTitle) {
    var vfontSize = 40.0;
    if (_subTitle.length > 7) {
      vfontSize = 30.0;
    }
    return vfontSize;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _displayScreen(context, id),
      splashColor: Theme.of(context).primaryColor,
      //so that wave effect could be of the same size as is the size of the tile
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 70,
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: double.infinity,
                  color: Colors.grey.shade800,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.white,
              //     spreadRadius: 3,
              //     blurRadius: 5,
              //     offset: Offset(0, 1), // changes position of shadow
              //   ),
              // ],
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                //colors: [Colors.orange.shade200, Colors.blueAccent.shade100]),
                colors: [Colors.cyan.shade800, Colors.green.shade100],
              ),
            ),
          ),
          Container(
            //alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: 50,
              bottom: 2,
            ),
            height: 110,
            width: double.infinity,
            color: Colors.transparent,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _fontSize(subTitle),
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 5,
              right: 10,
            ),
            alignment: Alignment.bottomRight,
            height: 120,
            width: double.infinity,
            color: Colors.transparent,
            child: Text(
              unit,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../globals.dart';
import '../dealer_sale_profile/dealer_sale_screen.dart';
import '../contact_officers/contact_officers.dart';
import '../sale_order_report/sale_order_report_screen.dart';
import '../invoice_report/invoice_report_screen.dart';
import '../invoice_print/invoice_print_screen.dart';
import '../fertilizers/fert_screen.dart';
import '../oft_reg_forms/reg_forms_screen.dart';
import '../tax_exemp_cert/tax_tabs_screen.dart';

class ShowOtherTilesItem extends StatelessWidget {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;
  final double _iconFontSize = 48;
  final Color _iconColor = Colors.cyan.shade700;
  final urlUserGuide =
      'https://ffcportal.ffc.com.pk:8881/opendocumentnew/zsda.jsp';
  ShowOtherTilesItem(this.id, this.title, this.subTitle, this.tileColor);

  void _displayScreen(BuildContext ctx, String tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 'x1') {
      Navigator.of(ctx).pushNamed(DealerSaleScreen.routeName);
    }
    if (tileID == 'x2') {
      Navigator.of(ctx).pushNamed(RegFormsScreen.routeName);
    }
    if (tileID == 'x3') {
      Navigator.of(ctx).pushNamed(SaleOrderReportScreen.routeName);
    }
    if (tileID == 'x4') {
      Navigator.of(ctx).pushNamed(InvoiceReportScreen.routeName);
    }
    if (tileID == 'x5') {
      Navigator.of(ctx).pushNamed(TaxTabsScreen.routeName);
    }
    if (tileID == 'x6') {
      Navigator.of(ctx).pushNamed(InvoicePrintScreen.routeName);
    }
    if (tileID == 'x7') {
      Navigator.of(ctx).pushNamed(ContactOfficers.routeName);
    }
    if (tileID == 'x8') {
      Navigator.of(ctx).pushNamed(FertilizersScreen.routeName);
    }
    if (tileID == 'x9') {
      launch(urlUserGuide);
    }
  }

  Icon _displayIcon(BuildContext ctx, String tileID) {
    //Based on tile IDs, different icons are displayed
    if (tileID == 'x1') {
      //pending order
      return Icon(
        Icons.speaker_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'x2') {
      //account balance
      return Icon(
        Icons.format_align_center_rounded,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'x3') {
      //DTP
      return Icon(
        Icons.description_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'x4') {
      //Price List
      return Icon(
        Icons.description_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'x5') {
      //Tax Exemption Certificates
      return Icon(
        Icons.document_scanner_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'x6') {
      //About
      return Icon(
        //Icons.notification_important_outlined,
        Icons.print_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'x7') {
      //About
      return Icon(
        //Icons.notification_important_outlined,
        Icons.supervised_user_circle_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'x8') {
      //FFC Fertilizers
      return Icon(
        //Icons.notification_important_outlined,
        Icons.grass_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    if (tileID == 'x9') {
      //User guide
      return Icon(
        //Icons.notification_important_outlined,
        Icons.help_outline_outlined,
        color: _iconColor,
        size: _iconFontSize,
      );
    }
    //to address warning of no return statement in the function
    return Icon(
      Icons.data_usage_rounded,
      color: _iconColor,
      size: _iconFontSize,
    );
  }

  double _fontSize() {
    if (Globals.varSize < const Size(360.0, 680.0)) {
      return 18;
    } else {
      return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _displayScreen(context, id),
      //splashColor: Theme.of(context).primaryColor,
      //so that wave effect could be of the same size as is the size of the tile
      //borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            //color: Color(0xFFF05A22),
            color: Colors.teal.shade900,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          //boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 3)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(top: 5),
              color: Colors.transparent,
              width: double.infinity,
              height: 25,
              child: _displayIcon(context, id),
            ),
            Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 35),
              width: double.infinity,
              height: 58,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _fontSize(),
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 45,
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

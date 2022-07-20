import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './home/home_tabs_screen.dart';
import './pending_orders/po_summary_screen.dart';
import './account_balance/account_balance_screen.dart';
import './dtp/dtp_screen.dart';
import './globals.dart';
import './about.dart';
import './notifications/notifications_tiles_screen.dart';
import './contact_officers/contact_officers.dart';
import './fertilizers/fert_screen.dart';
import './dealer_sale_profile/dealer_sale_screen.dart';
import './privacy_policy.dart';

class MainDrawer extends StatelessWidget {
  final url =
      'https://ffcportal.ffc.com.pk:8881/opendocumentnew/ZPList.jsp?SDIST=' +
          Globals.globalSalesDist;
  // final _urlInvReport =
  //     'https://ffcportal.ffc.com.pk:8881/opendocumentnew/invoicereport.jsp?dealer=' +
  //         Globals.dealerCode;
  // final _urlOrdReport =
  //     'https://ffcportal.ffc.com.pk:8881/opendocumentnew/ordersreport.jsp';
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      tileColor: Colors.transparent,
      hoverColor: Colors.amber,
      selected: false,
      //selectedTileColor: Colors.orangeAccent.shade100,
      leading: Icon(
        icon,
        color: Colors.blue.shade700,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          //fontFamily: 'RobotoCondensed',
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      onTap: tapHandler,
    );
  }

  // Widget buildListTileforReports(
  //     BuildContext context, String title, IconData icon) {
  //   return ListTile(
  //     tileColor: Colors.transparent,
  //     hoverColor: Colors.amber,
  //     selected: false,
  //     leading: Icon(
  //       icon,
  //       color: Colors.blue.shade700,
  //       size: 28,
  //     ),
  //     title: Row(
  //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(
  //             //fontFamily: 'RobotoCondensed',
  //             fontSize: 18,
  //             color: Colors.black,
  //           ),
  //         ),
  //         DropdownButton(
  //           underline: Container(),
  //           icon: Icon(
  //             Icons.arrow_forward_rounded,
  //             size: 28,
  //             color: Colors.black,
  //           ),
  //           items: [
  //             DropdownMenuItem(
  //               child: Container(
  //                 child: Row(
  //                   children: <Widget>[
  //                     Icon(Icons.arrow_downward_rounded),
  //                     SizedBox(width: 8),
  //                     Text('Sales Order'),
  //                   ],
  //                 ),
  //               ),
  //               value: 'order',
  //             ),
  //             DropdownMenuItem(
  //               child: Container(
  //                 child: Row(
  //                   children: <Widget>[
  //                     Icon(Icons.arrow_downward_rounded),
  //                     SizedBox(width: 8),
  //                     Text('Ord./Inv.Rep'),
  //                   ],
  //                 ),
  //               ),
  //               value: 'invoice',
  //             ),
  //           ],
  //           onChanged: (itemIdentifier) {
  //             if (itemIdentifier == 'order') {
  //               Navigator.of(context).pop();
  //               launch(_urlOrdReport);
  //             }
  //             if (itemIdentifier == 'invoice') {
  //               Navigator.of(context).pop();
  //               launch(_urlInvReport);
  //             }
  //           },
  //         ),
  //       ],
  //     ),
  //     onTap: () {},
  //   );
  // }

//Safe area widget is used to avoid the objects roll on other objects
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                color: Theme.of(context).primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        Globals.dealerName,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        Globals.dealerCode,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        Globals.dealerAddress,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              buildListTile('Home', Icons.home, () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeTabsScreen.routeName);
              }),
              buildListTile('Dealer Account Balance', Icons.account_balance,
                  () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AccountBalanceScreen.routeName);
              }),
              buildListTile('Pending Orders', Icons.local_shipping_rounded, () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushNamed(PendingOrderSummaryScreen.routeName);
              }),
              buildListTile('Sales Profile', Icons.speaker_outlined, () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(DealerSaleScreen.routeName);
              }),

              buildListTile('Dealer Transfer Price', Icons.deck_outlined, () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(DealerTransferPrice.routeName);
              }),
              // Divider(
              //   color: Colors.green.shade700,
              //   thickness: 1.0,
              // ),
              // buildListTile('Sales Order Report', Icons.arrow_circle_down, () {
              //   Navigator.of(context).pop();
              //   Navigator.of(context).pushNamed(DealerTransferPrice.routeName);
              // }),
              Divider(
                color: Colors.green.shade700,
                thickness: 1.0,
              ),
              buildListTile('Product Price List', Icons.print_sharp, () {
                Navigator.of(context).pop();
                launch(url);
                //Navigator.of(context)
                //.pushReplacementNamed(DealerSaleProfile.routeName);
              }),
              buildListTile('Contact Officers', Icons.contact_phone_outlined,
                  () {
                Navigator.of(context).pushNamed(ContactOfficers.routeName);
              }),
              buildListTile('Notifications', Icons.notification_important, () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .pushNamed(NotificationTilesScreen.routeName);
              }),
              buildListTile('FFC Fertilizers', Icons.grass, () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(FertilizersScreen.routeName);
              }),
              Divider(
                color: Colors.green.shade700,
                thickness: 1.0,
              ),
              buildListTile('About', Icons.info, () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(AboutApplication.routeName);
              }),
              buildListTile('Privacy Policy', Icons.privacy_tip, () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(PrivayPolicy.routeName);
              }),
              ListTile(
                title: Text(
                  'Sona Dost :: version 2.0.7',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

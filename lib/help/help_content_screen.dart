import 'package:flutter/material.dart';
import '../colors.dart';
import './help_pending_order.dart';
import './help_account_balance_screen.dart';
import './help_dtp_screen.dart';
import './help_prod_price_list_screen.dart';
import './help_sales_profile_screen.dart';
import './help_sale_ord_report_screen.dart';
import './help_inv_report_screen.dart';
import './help_kashtkaar_desk_screen.dart';
import './help_ffc_fert_screen.dart';

class HelpContentScreen extends StatelessWidget {
  static const routeName = '/helpContentScreen';
  final Color helpBackColor = Colors.grey.shade400;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            MyColors.backgroundColor1,
            MyColors.backgroundColor2,
            MyColors.backgroundColor3,
          ])),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.amber.shade400,
                  height: 60,
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Icon(
                    Icons.help_center_rounded,
                    color: Colors.blue.shade800,
                    size: 40,
                  ),
                ),
                Container(
                  color: Colors.amber.shade400,
                  height: 60,
                  width: 200,
                  padding: EdgeInsets.only(
                    left: 5,
                    top: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Help Topics',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.amber.shade400,
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    alignment: Alignment.centerRight,
                    height: 60,
                    child: Text(
                      'مددکےعنوانات',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Urdu',
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'تفصیل دیکھنے کیلئے کسی عنوان پر ٹیپ کریں',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Urdu',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: helpBackColor,
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(HelpPendingOrders.routeName);
                  // Fluttertoast.showToast(
                  //     msg: "Under Development...",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.blue,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0);
                },
                child: Row(
                  children: [
                    MyBullet(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      child: Text(
                        'Pending Orders',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 30,
                        child: Text(
                          'زیر التواء آرڈرز',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Urdu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: helpBackColor,
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(HelpAccountBalScreen.routeName);
                },
                child: Row(
                  children: [
                    MyBullet(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      child: Text(
                        'Dealer Account Balance',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 35,
                        child: Text(
                          'اکاؤنٹ بیلنس',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Urdu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: helpBackColor,
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(HelpDtpScreen.routeName);
                },
                child: Row(
                  children: [
                    MyBullet(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      child: Text(
                        'Dealer Transfer Price',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 30,
                        child: Text(
                          'ڈیلر کے لئے قیمت',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Urdu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: helpBackColor,
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(HelpProdPriceListScreen.routeName);
                },
                child: Row(
                  children: [
                    MyBullet(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 25,
                      child: Text(
                        'Product Price List',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 30,
                        child: Text(
                          'مصنوعات کی قیمتوں کی فہرست',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Urdu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: helpBackColor,
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(HelpSalesProfileScreen.routeName);
                },
                child: Row(
                  children: [
                    MyBullet(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 25,
                      child: Text(
                        'Sales Profile',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 30,
                        child: Text(
                          'سیلز پروفائل',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Urdu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   color: helpBackColor,
            //   height: 40,
            //   alignment: Alignment.topCenter,
            //   padding: EdgeInsets.only(
            //     left: 10,
            //     right: 10,
            //     top: 5,
            //   ),
            //   child: GestureDetector(
            //     onTap: () {
            //       //Navigator.of(context).pushNamed(HelpDealerLocation.routeName);
            //     },
            //     child: Row(
            //       children: [
            //         MyBullet(),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Container(
            //           alignment: Alignment.centerLeft,
            //           height: 25,
            //           child: Text(
            //             'Annual Tax Certificate',
            //             style: TextStyle(
            //               fontSize: 18,
            //             ),
            //             textAlign: TextAlign.start,
            //             overflow: TextOverflow.ellipsis,
            //             maxLines: 1,
            //             softWrap: true,
            //           ),
            //         ),
            //         Expanded(
            //           child: Container(
            //             alignment: Alignment.centerRight,
            //             height: 35,
            //             child: Text(
            //               'ٹیکس سرٹیفکیٹ ',
            //               textAlign: TextAlign.right,
            //               style: TextStyle(
            //                 fontSize: 24,
            //                 fontFamily: 'Urdu',
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              color: helpBackColor,
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(HelpSaleOrderReportScreen.routeName);
                },
                child: Row(
                  children: [
                    MyBullet(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 25,
                      child: Text(
                        'Sales Order Report',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 35,
                        child: Text(
                          'سیل آرڈر رپورٹ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Urdu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: helpBackColor,
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(HelpInvoiceReportScreen.routeName);
                },
                child: Row(
                  children: [
                    MyBullet(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 25,
                      child: Text(
                        'Invoice Report',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 35,
                        child: Text(
                          'انوائس رپورٹ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Urdu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: helpBackColor,
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(HelpKashtkaarDeskScreen.routeName);
                },
                child: Row(
                  children: [
                    MyBullet(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 25,
                      child: Text(
                        'Kashtkaar Desk',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 35,
                        child: Text(
                          'کاشتکار ڈيسک ',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Urdu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: helpBackColor,
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(HelpFfcFertScreen.routeName);
                },
                child: Row(
                  children: [
                    MyBullet(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 25,
                      child: Text(
                        'FFC Fertilizers',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 35,
                        child: Text(
                          'ایف ایف سی کی کھادیں',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Urdu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        color: Colors.teal.shade800,
        shape: BoxShape.circle,
      ),
    );
  }
}

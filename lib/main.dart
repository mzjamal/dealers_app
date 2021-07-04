import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_it/get_it.dart';
import './home/home_tabs_screen.dart';
import './about.dart';
import './pending_orders/po_summary_screen.dart';
import './pending_orders/po_dealer_wise_screen.dart';
import './my_profile/my_profile_screen.dart';
import './pending_orders/po_detail_table.dart';
import './notifications/notifications.dart';
import './account_balance/account_balance_screen.dart';
import './dtp/dtp_screen.dart';
import './hosd/hosd_screen.dart';
import './dealer_sale_profile/dealer_sale_screen.dart';
import './show_other_options/show_other_tiles.dart';
import './help/help_content_screen.dart';
import './dashboard/dashboard_screen.dart';
import './contact_officers/contact_officers.dart';
import './kashtkaar_desk/kashtkaar_desk_screen.dart';
import './kashtkaar_desk/crop_booklets/crop_booklets_screen.dart';
import './kashtkaar_desk/crop_documentaries/crop_doc_screen.dart';
import './kashtkaar_desk/zarai_reports/zarai_report_screen.dart';
import './sale_order_report/sale_order_report_screen.dart';
import './invoice_report/invoice_report_screen.dart';
import './dashboard/month_sales/month_sales_screen.dart';
import './dashboard/orders_30_days/orders_30_screen.dart';
import './dashboard/orders_60_days/orders_60_screen.dart';
import './dashboard/previous_year_sale/prev_year_sale_screen.dart';
import './sale_order_print/sale_order_print_screen.dart';
import './invoice_print/invoice_print_screen.dart';
import './tax_certificate/tax_certificate_screen.dart';
import './help/help_pending_order.dart';
import './notifications/notifications_tiles_screen.dart';
import './notifications/invoices_new/invoices_noti_screen.dart';
import './notifications/fi_new/fi_new_notif_screen.dart';
import './notifications/fi_cancel/fi_cancel_noti_screen.dart';
import './notifications/orders_new/order_new_noti_screen.dart';
import './help/help_account_balance_screen.dart';
import './help/help_dtp_screen.dart';
import './help/help_prod_price_list_screen.dart';
import './help/help_sales_profile_screen.dart';
import './invoice_report/invoice_notif_display_screen.dart';
import './notifications/invoices_cancel/invoices_noti_screen.dart';
import './fertilizers/fert_screen.dart';
import './fertilizers/sona_urea.dart';
import './fertilizers/ffc_dap_screen.dart';
import './fertilizers/ffc_sop_screen.dart';
import './fertilizers/ffc_mop_screen.dart';
import './fertilizers/sona_zinc_screen.dart';
import './fertilizers/sona_boron_screen.dart';
import './help/help_sale_ord_report_screen.dart';
import './help/help_inv_report_screen.dart';
import './help/help_kashtkaar_desk_screen.dart';
import './help/help_ffc_fert_screen.dart';
import './cash_credit_ratios/cash_credit_ratios_screen.dart';
import './welcome_screen/welcome_screen.dart';
import './notifications/order_cancel/order_can_notif_screen.dart';
import './notifications/other_notif/other_notif_screen.dart';
import './notifications/other_notif/other_notif_detail_screen.dart';

//code to make calls
class CallService {
  void call(String cellNumber) {
    launch("tel:$cellNumber");
  }
}

GetIt locator = GetIt.asNewInstance();

void set() {
  locator.registerSingleton(CallService());
}

void main() {
  set();
  //Setting device orientation to portrait only
  //On some devices this setting might require as of new Flutter version
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DarkLightTheme();
  }
}

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({Key key}) : super(key: key);

  @override
  _DarkLightThemeState createState() => _DarkLightThemeState();
}

//Creating themes for the app
ThemeData _ligthTheme = ThemeData(
  accentColor: Colors.amber,
  //brightness: Brightness.light,
  //primaryColor: Colors.blue,
  primaryColor: Colors.teal.shade800,
  //primarySwatch: Colors.yellow,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue.shade700,
  ),
);
ThemeData _darkTheme = ThemeData(
  accentColor: Colors.red,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.amber,
  ),
);

bool _light = true;
Future<bool> _lightF;

class _DarkLightThemeState extends State<DarkLightTheme> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // //save and get theme menthods
  // _saveTheme() async {
  //   SharedPreferences pref = await _prefs;
  //   pref.setBool('theme', _light);
  // }

  _getTheme() async {
    _lightF = _prefs.then((SharedPreferences prefs) {
      return prefs.get('theme') != null ? prefs.getBool('theme') : true;
    });
    _light = await _lightF;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getTheme();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Colors.green.shade300, //or set color with: Color(0xFF0000FF)
    ));
    return FutureBuilder(
        future: _lightF,
        builder: (context, snapshot) {
          return MaterialApp(
            theme: _light ? _ligthTheme : _darkTheme,
            title: 'Sona Dost App',
            darkTheme: _darkTheme,
            //to remove debug banner while running
            debugShowCheckedModeBanner: false,
            //home: homePage(),
            initialRoute: '/',
            routes: {
              '/': (ctx) => WelcomeScreen(),
              AboutApplication.routeName: (ctx) => AboutApplication(),
              PendingOrderSummaryScreen.routeName: (ctx) =>
                  PendingOrderSummaryScreen(),
              PoDealerWiseScreen.routeName: (ctx) => PoDealerWiseScreen(),
              HomeTabsScreen.routeName: (ctx) => HomeTabsScreen(),
              MyProfileScreen.routeName: (ctx) => MyProfileScreen(),
              PendingOrdersDetail.routeName: (ctx) => PendingOrdersDetail(),
              Notifications.routeName: (ctx) => Notifications(),
              AccountBalanceScreen.routeName: (ctx) => AccountBalanceScreen(),
              DealerTransferPrice.routeName: (ctx) => DealerTransferPrice(),
              HosdScreen.routeName: (ctx) => HosdScreen(),
              DealerSaleScreen.routeName: (ctx) => DealerSaleScreen(),
              ShowOtherTiles.routeName: (ctx) => ShowOtherTiles(),
              HelpContentScreen.routeName: (ctx) => HelpContentScreen(),
              DashboardScreen.routeName: (ctx) => DashboardScreen(),
              ContactOfficers.routeName: (ctx) => ContactOfficers(),
              KashtkaarDeskScreen.routeName: (ctx) => KashtkaarDeskScreen(),
              CropBookletsScreen.routeName: (ctx) => CropBookletsScreen(),
              CropDocumentaryScreen.routeName: (ctx) => CropDocumentaryScreen(),
              ZaraiReportScreen.routeName: (ctx) => ZaraiReportScreen(),
              SaleOrderReportScreen.routeName: (ctx) => SaleOrderReportScreen(),
              InvoiceReportScreen.routeName: (ctx) => InvoiceReportScreen(),
              MonthSalesScreen.routeName: (ctx) => MonthSalesScreen(),
              OrdersLast30DaysScreen.routeName: (ctx) =>
                  OrdersLast30DaysScreen(),
              OrdersLast60DaysScreen.routeName: (ctx) =>
                  OrdersLast60DaysScreen(),
              PreviousYearSaleScreen.routeName: (ctx) =>
                  PreviousYearSaleScreen(),
              SaleOrderPrintScreen.routeName: (ctx) => SaleOrderPrintScreen(),
              InvoicePrintScreen.routeName: (ctx) => InvoicePrintScreen(),
              TaxCertificateScreen.routeName: (ctx) => TaxCertificateScreen(),
              HelpPendingOrders.routeName: (ctx) => HelpPendingOrders(),
              NotificationTilesScreen.routeName: (ctx) =>
                  NotificationTilesScreen(),
              InvoicesNotificationScreen.routeName: (ctx) =>
                  InvoicesNotificationScreen(),
              FiNewNotificationScreen.routeName: (ctx) =>
                  FiNewNotificationScreen(),
              FiCancelNotificationScreen.routeName: (ctx) =>
                  FiCancelNotificationScreen(),
              OrdersNewNotifScreen.routeName: (ctx) => OrdersNewNotifScreen(),
              HelpAccountBalScreen.routeName: (ctx) => HelpAccountBalScreen(),
              HelpDtpScreen.routeName: (ctx) => HelpDtpScreen(),
              HelpProdPriceListScreen.routeName: (ctx) =>
                  HelpProdPriceListScreen(),
              HelpSalesProfileScreen.routeName: (ctx) =>
                  HelpSalesProfileScreen(),
              InvoiceNotifDispScreen.routeName: (ctx) =>
                  InvoiceNotifDispScreen(),
              InvoicesCanNotificationScreen.routeName: (ctx) =>
                  InvoicesCanNotificationScreen(),
              FertilizersScreen.routeName: (ctx) => FertilizersScreen(),
              SonaUreaFertScreen.routeName: (ctx) => SonaUreaFertScreen(),
              FfcDapFertScreen.routeName: (ctx) => FfcDapFertScreen(),
              FfcSopFertScreen.routeName: (ctx) => FfcSopFertScreen(),
              FfcMopFertScreen.routeName: (ctx) => FfcMopFertScreen(),
              SonaZincFertScreen.routeName: (ctx) => SonaZincFertScreen(),
              SonaBoronFertScreen.routeName: (ctx) => SonaBoronFertScreen(),
              HelpSaleOrderReportScreen.routeName: (ctx) =>
                  HelpSaleOrderReportScreen(),
              HelpInvoiceReportScreen.routeName: (ctx) =>
                  HelpInvoiceReportScreen(),
              HelpKashtkaarDeskScreen.routeName: (ctx) =>
                  HelpKashtkaarDeskScreen(),
              HelpFfcFertScreen.routeName: (ctx) => HelpFfcFertScreen(),
              CashCreditRatiosScreen.routeName: (ctx) =>
                  CashCreditRatiosScreen(),
              OrderCancelNotifScreen.routeName: (ctx) =>
                  OrderCancelNotifScreen(),
              OtherNotificationScreen.routeName: (ctx) =>
                  OtherNotificationScreen(),
              OtherNotifDetailScreen.routeName: (ctx) =>
                  OtherNotifDetailScreen(),
            },
          );
        });
  }
}

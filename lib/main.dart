import 'package:flutter/material.dart';
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
import './registration_forms/registration_forms.dart';

Map<int, Color> myColor = {
  50: Color.fromRGBO(0, 105, 92, .1),
  100: Color.fromRGBO(0, 105, 92, .2),
  200: Color.fromRGBO(0, 105, 92, .3),
  300: Color.fromRGBO(0, 105, 92, .4),
  400: Color.fromRGBO(0, 105, 92, .5),
  500: Color.fromRGBO(0, 105, 92, .6),
  600: Color.fromRGBO(0, 105, 92, .7),
  700: Color.fromRGBO(0, 105, 92, .8),
  800: Color.fromRGBO(0, 105, 92, .9),
  900: Color.fromRGBO(0, 105, 92, 1),
};

//code to make calls
class CallService {
  void call(String cellNumber) {
    launch("tel:$cellNumber");
  }

  void sendMsg(String cellNumber) {
    launch("sms:$cellNumber");
  }

  void sendEmail(String emailAddr) {
    launch("mailto:$emailAddr");
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
  //static const MaterialColor primaryColor = MaterialColor(#00695C, swatch)
  final MaterialColor colorCustom = MaterialColor(0xFF00695C, myColor);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Colors.teal.shade500, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: 'Sona Dost App',
      theme: ThemeData(
        primaryColor: Colors.teal.shade800,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colorCustom,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: HomeScreen(),
      initialRoute: '/', //default is '/'
      //setting route table to list all available screens in the app
      //syntax is <string ID> : <builder function>
      // single slash '/' is used for home screen or very first screen but in our case we are
      //using '//' as very first screen i.e. welcome screen.. '/' was already used for HomeTabsScreen
      //and many pages have home key icon. To avoid changing all the pages, '//' has been associated with
      //very first page by setting it to the property "initialRoute"
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
        OrdersLast30DaysScreen.routeName: (ctx) => OrdersLast30DaysScreen(),
        OrdersLast60DaysScreen.routeName: (ctx) => OrdersLast60DaysScreen(),
        PreviousYearSaleScreen.routeName: (ctx) => PreviousYearSaleScreen(),
        SaleOrderPrintScreen.routeName: (ctx) => SaleOrderPrintScreen(),
        InvoicePrintScreen.routeName: (ctx) => InvoicePrintScreen(),
        TaxCertificateScreen.routeName: (ctx) => TaxCertificateScreen(),
        HelpPendingOrders.routeName: (ctx) => HelpPendingOrders(),
        NotificationTilesScreen.routeName: (ctx) => NotificationTilesScreen(),
        InvoicesNotificationScreen.routeName: (ctx) =>
            InvoicesNotificationScreen(),
        FiNewNotificationScreen.routeName: (ctx) => FiNewNotificationScreen(),
        FiCancelNotificationScreen.routeName: (ctx) =>
            FiCancelNotificationScreen(),
        OrdersNewNotifScreen.routeName: (ctx) => OrdersNewNotifScreen(),
        HelpAccountBalScreen.routeName: (ctx) => HelpAccountBalScreen(),
        HelpDtpScreen.routeName: (ctx) => HelpDtpScreen(),
        HelpProdPriceListScreen.routeName: (ctx) => HelpProdPriceListScreen(),
        HelpSalesProfileScreen.routeName: (ctx) => HelpSalesProfileScreen(),
        InvoiceNotifDispScreen.routeName: (ctx) => InvoiceNotifDispScreen(),
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
        HelpInvoiceReportScreen.routeName: (ctx) => HelpInvoiceReportScreen(),
        HelpKashtkaarDeskScreen.routeName: (ctx) => HelpKashtkaarDeskScreen(),
        HelpFfcFertScreen.routeName: (ctx) => HelpFfcFertScreen(),
        CashCreditRatiosScreen.routeName: (ctx) => CashCreditRatiosScreen(),
        OrderCancelNotifScreen.routeName: (ctx) => OrderCancelNotifScreen(),
        OtherNotificationScreen.routeName: (ctx) => OtherNotificationScreen(),
        OtherNotifDetailScreen.routeName: (ctx) => OtherNotifDetailScreen(),
        RegistrationForms.routeName: (ctx) => RegistrationForms(),
      },
    );
  }
}

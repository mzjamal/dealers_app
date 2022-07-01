import 'package:flutter/material.dart';
import './hosd/sona_dost_tech.dart';

class Globals {
  static String globalSalesDist = '';
  static String dealerCode = '';
  static String dealerName = '';
  static String dealerAddress = '';
  static String globalSalesOfficerName = '';
  static String globalDesignation = '';
  static String deviceUUID = '';
  static String serviceUserName =
      Technics.serUN1 + Technics.serUN2 + Technics.serUN3;
  static String servicePass =
      Technics.secDetStart + Technics.secDetMid + '@' + Technics.secDetEnd;
  //Device width and heigth
  static double deviceWidth = 340.0;
  static double deviceHeight = 680.0;
  static Size varSize = Size(680.0, 340.0);

  //Notification related counters
  static int newOrderNotifications = 0;
  static int newInvoiceNotifications = 0;
  static String overAllNotifications = 'Loading..';

  //for users without account
  static String vTesting = 'N';

  //email IDs of HOSD and ATO
  static String emailAddrHosd = '';
  static String emailAddrAto = '';

  // notifications count
  //static String notifCount = '';
}

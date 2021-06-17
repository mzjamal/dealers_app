import 'package:flutter/material.dart';

class Globals {
  static String globalSalesDist = 'LHR';
  static String dealerCode = '1004292';
  static String dealerName = 'ALI & CO';
  static String dealerAddress =
      'TEHSIL MURIDKEY GHALLA MANDI NARANG SHEIKHUPURA';
  // static String dealerCode = '1004693';
  // static String dealerName = 'ABDULLAH TRADERS';
  // static String dealerAddress = 'MAIN G.T.ROAD, WAGHA, DISTRICT LAHORE';
  static String globalSalesOfficerName = '';
  static String globalDesignation = 'Lahore';
  static String deviceUUID = '';
  //username and password to access services
  static String serviceUserNameDev = 'zjamal';
  static String servicePassDev = 'Helloall@123';
  static String serviceUserName = 'BISRVUSR';
  static String servicePass = 'Initial@1';
  //Device width and heigth
  static double deviceWidth = 340.0;
  static double deviceHeight = 680.0;
  static Size varSize = Size(680.0, 340.0);

  //Notification related counters
  static int newOrderNotifications = 0;
  static int newInvoiceNotifications = 0;
  static int overAllNotifications = 0;

  //for users without account
  static String vTesting = 'N';

  //email IDs of HOSD and ATO
  static String emailAddrHosd = '';
  static String emailAddrAto = '';
}

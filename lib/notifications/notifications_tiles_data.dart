import './notification_tile_model.dart';
import '../colors.dart';
import '../globals.dart';

var notificationTiles = [
  NotificationScreenTile(
    id: 'n1',
    title: 'Orders Intimation',
    tileColor: MyColors.homeTileColor1,
    subTitle: ' آرڈرکی اطلاع',
    notification: Globals.newOrderNotifications.toString(),
  ),
  NotificationScreenTile(
    id: 'n2',
    title: 'Invoices Intimation',
    tileColor: MyColors.homeTileColor1,
    subTitle: 'انوائس کی اطلاع',
    notification: Globals.newInvoiceNotifications.toString(),
  ),
  NotificationScreenTile(
    id: 'n3',
    title: 'Orders Cancellation',
    tileColor: MyColors.homeTileColor1,
    subTitle: 'آرڈرکی منسوخی',
    notification: '0',
  ),
  NotificationScreenTile(
    id: 'n4',
    title: 'Invoices Cancellation',
    tileColor: MyColors.homeTileColor1,
    subTitle: 'انوائس کی منسوخی',
    notification: '0',
  ),
  NotificationScreenTile(
    id: 'n5',
    title: 'FI Receipts',
    tileColor: MyColors.homeTileColor1,
    subTitle: 'ایف آئی کی اطلاع',
    notification: '1',
  ),
  NotificationScreenTile(
    id: 'n6',
    title: 'FI Cancellations',
    tileColor: MyColors.homeTileColor1,
    subTitle: 'ایف آئی کی منسوخی',
    notification: '0',
  ),
  NotificationScreenTile(
    id: 'n7',
    title: 'Others',
    tileColor: MyColors.homeTileColor1,
    subTitle: 'دیگر اطلاعات',
    notification: '0',
  ),
];

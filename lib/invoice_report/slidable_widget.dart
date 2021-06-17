import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import './invoice_notif_display_screen.dart';

//enum SlidableAction { archive, share, more, delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final String invoiceNumber;
  //final Function(SlidableAction action) onDismissed;
  // final String _urlInv =
  //     'https://ffcportal.ffc.com.pk:8881/opendocumentnew/invprint.jsp?invno=';

  const SlidableWidget({
    @required this.child,
    @required this.invoiceNumber,

    //@required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var controller = SlidableController();
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: child,
      //closeOnScroll: false,

      /// left side
      actions: <Widget>[
        // IconSlideAction(
        //   caption: 'Print',
        //   closeOnTap: true,
        //   color: Colors.grey.shade500,
        //   icon: Icons.print,
        //   onTap: () {
        //     //launch(_urlInv + invoiceNumber);
        //   },
        // ),
        IconSlideAction(
          caption: 'View Notification',
          closeOnTap: true,
          color: Colors.teal.shade800,
          icon: Icons.circle_notifications,
          onTap: () {
            Navigator.of(context)
                .pushNamed(InvoiceNotifDispScreen.routeName, arguments: {
              'invNumber': invoiceNumber,
            });
          },
        ),
        // IconSlideAction(
        //   caption: 'Notifications',
        //   closeOnTap: true,
        //   color: Colors.amber.shade400,
        //   icon: Icons.circle_notifications,
        //   onTap: () {
        //     Navigator.of(context)
        //         .pushNamed(InvoicesNotificationScreen.routeName);
        //     // Fluttertoast.showToast(
        //     //     msg: 'In Progress......Coming soon',
        //     //     toastLength: Toast.LENGTH_LONG,
        //     //     gravity: ToastGravity.CENTER,
        //     //     timeInSecForIosWeb: 1,
        //     //     backgroundColor: Colors.teal.shade600,
        //     //     textColor: Colors.white,
        //     //     fontSize: 18.0);
        //   },
        // ),
        // IconSlideAction(
        //   caption: 'Cancel',
        //   closeOnTap: true,
        //   color: Colors.indigo,
        //   icon: Icons.description_outlined,
        //   onTap: () {
        //     //print(invoiceNumber);
        //     Navigator.of(context).pop(false);
        //   },
        // ),
      ],

      /// right side
      secondaryActions: <Widget>[
        // IconSlideAction(
        //   caption: 'Print',
        //   closeOnTap: true,
        //   color: Colors.grey.shade500,
        //   icon: Icons.print,
        //   onTap: () {
        //     launch(_urlInv + invoiceNumber);
        //   },
        // ),
        IconSlideAction(
          caption: 'View Notification',
          closeOnTap: true,
          color: Colors.teal.shade800,
          icon: Icons.circle_notifications,
          onTap: () {
            Navigator.of(context)
                .pushNamed(InvoiceNotifDispScreen.routeName, arguments: {
              'invNumber': invoiceNumber,
            });
          },
        ),
        // IconSlideAction(
        //   caption: 'Notifications',
        //   closeOnTap: true,
        //   color: Colors.amber.shade400,
        //   icon: Icons.circle_notifications,
        //   onTap: () {
        //     Navigator.of(context)
        //         .pushNamed(InvoicesNotificationScreen.routeName);
        //   },
        // ),
      ],
    );
  }
}

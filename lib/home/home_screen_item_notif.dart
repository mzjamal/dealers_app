import 'package:flutter/material.dart';

class HomeScreenItemNotif extends StatelessWidget {
  final String id;
  final String notifCount;

  HomeScreenItemNotif(
    this.id,
    this.notifCount,
  );

  @override
  Widget build(BuildContext context) {
    //we normally wrap container with GestureDetector or InkWell so that we may have
    //multiple listeners for tap, double tap etc.
    return InkWell(
      //onTap: () => _displayScreen(context, id),
      //splashColor: Theme.of(context).primaryColor,
      //so that wave effect could be of the same size as is the size of the tile
      //borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              padding: const EdgeInsets.only(
                top: 10,
                left: 100,
              ),
              width: double.infinity,
              height: 50,
              child: Text(
                notifCount,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

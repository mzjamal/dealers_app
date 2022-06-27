import 'package:flutter/material.dart';
import './registration_forms.dart';
import './reg_hbl_screen.dart';

class RegFormsItem extends StatelessWidget {
  final String id;
  final String title;
  final String subTitle;

  RegFormsItem(
    this.id,
    this.title,
    this.subTitle,
  );

  void _displayScreen(BuildContext ctx, String tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 't1') {
      Navigator.of(ctx).pushNamed(RegHBLScreen.routeName);
    }
    if (tileID == 't2') {
      Navigator.of(ctx).pushNamed(RegistrationForms.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _displayScreen(context, id),
      splashColor: Theme.of(context).primaryColor,
      //so that wave effect could be of the same size as is the size of the tile
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          //color: tileColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue.shade100,
              Colors.indigo.shade200,
            ],
          ),
        ),
      ),
    );
  }
}

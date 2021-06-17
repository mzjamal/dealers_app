import 'package:flutter/material.dart';
import './sona_urea.dart';
import './ffc_dap_screen.dart';
import './ffc_sop_screen.dart';
import './ffc_mop_screen.dart';
import './sona_zinc_screen.dart';
import './sona_boron_screen.dart';

class FertilizerTileItem extends StatelessWidget {
  final String id;
  final String title;
  final String subTitle;
  //final double _iconFontSize = 64;
  //final Color _iconColor = Colors.green.shade700;

  Image _displayIcon(BuildContext ctx, String tileID) {
    //Based on tile IDs, different icons are displayed
    if (tileID == 'f1') {
      return Image.asset(
        "assets/images/sonaurea.png",
      );
    }
    if (tileID == 'f2') {
      return Image.asset(
        "assets/images/ffcdap.png",
      );
    }
    if (tileID == 'f3') {
      return Image.asset(
        "assets/images/ffcsop.png",
      );
    }
    if (tileID == 'f4') {
      return Image.asset(
        "assets/images/ffcmop.png",
      );
    }
    if (tileID == 'f5') {
      return Image.asset(
        "assets/images/sonazinc.png",
      );
    }
    if (tileID == 'f6') {
      return Image.asset(
        "assets/images/sonaboron.png",
      );
    }
    //to address warning of no return statement in the function
    return Image.asset(
      "assets/images/sonaurea.png",
    );
  }

  FertilizerTileItem(
    this.id,
    this.title,
    this.subTitle,
  );

  void _displayScreen(BuildContext ctx, String tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 'f1') {
      Navigator.of(ctx).pushNamed(SonaUreaFertScreen.routeName);
    }
    if (tileID == 'f2') {
      Navigator.of(ctx).pushNamed(FfcDapFertScreen.routeName);
    }
    if (tileID == 'f3') {
      Navigator.of(ctx).pushNamed(FfcSopFertScreen.routeName);
    }
    if (tileID == 'f4') {
      Navigator.of(ctx).pushNamed(FfcMopFertScreen.routeName);
    }
    if (tileID == 'f5') {
      Navigator.of(ctx).pushNamed(SonaZincFertScreen.routeName);
    }
    if (tileID == 'f6') {
      Navigator.of(ctx).pushNamed(SonaBoronFertScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _displayScreen(context, id),
      //splashColor: Theme.of(context).primaryColor,
      //so that wave effect could be of the same size as is the size of the tile
      //borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            //color: Color(0xFFF05A22),
            color: Colors.teal.shade900,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  top: 1,
                  left: 10,
                ),
                color: Colors.transparent,
                //width: MediaQuery.of(context).size.width * 0.4,
                width: 90,
                height: 120,
                child: _displayIcon(context, id),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                padding: const EdgeInsets.only(top: 2),
                //width: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.25,
                height: 20,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    //fontFamily: 'Urdu',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                //padding: const EdgeInsets.only(top: 10),
                //width: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.18,
                height: 60,
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Urdu',
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

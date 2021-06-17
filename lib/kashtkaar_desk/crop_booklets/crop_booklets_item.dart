import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class CropBookletsItem extends StatelessWidget {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;
  final _urlWheat =
      'https://www.ffc.com.pk/wp-content/uploads/Wheat-Cultivation-1.pdf';
  final _urlCotton =
      'https://www.ffc.com.pk/wp-content/uploads/Cotton-Cultivation.pdf';
  final _urlRice =
      'https://www.ffc.com.pk/wp-content/uploads/RiceCultivation.pdf';
  final _urlDate =
      'https://www.ffc.com.pk/wp-content/uploads/Date-Cultivation.pdf';
  final _urlBanana = 'https://www.ffc.com.pk/wp-content/uploads/Banana.pdf';
  final _urlMaize =
      'https://www.ffc.com.pk/wp-content/uploads/Maize-Brochure.pdf';
  final _urlMango = 'https://www.ffc.com.pk/wp-content/uploads/cult_mango.pdf';
  final _urlOilSeeds =
      'https://www.ffc.com.pk/wp-content/uploads/Oil-Seeds-Cultivation-1.pdf';
  final _urlGuava =
      'https://www.ffc.com.pk/wp-content/uploads/Guava-Cultivation.pdf';
  final _urlSugarcane =
      'https://www.ffc.com.pk/wp-content/uploads/Sugarcane-Cultivation.pdf';
  final _urlCitrus = 'https://www.ffc.com.pk/wp-content/uploads/Citrus.pdf';
  final _urlSalt =
      'https://www.ffc.com.pk/wp-content/uploads/Reclamation-of-Salt-Affected-Soils-1.pdf';
  final _urlPotato =
      'https://www.ffc.com.pk/wp-content/uploads/Potato-Cultivation.pdf';
  final _urlVegi =
      'https://www.ffc.com.pk/wp-content/uploads/Vegetables-Brochure-1.pdf';
  final _urlOrchard =
      'https://www.ffc.com.pk/wp-content/uploads/Fertilizer-Recommendations-for-Orchards.pdf';
  final _urlPunjab =
      'https://www.ffc.com.pk/marketing-group/kashtkar-desk/soil-fertility-atlas-of-pakistan-punjab/';
  final _urlSindh =
      'https://www.ffc.com.pk/marketing-group/kashtkar-desk/soil-fertility-atlas-of-pakistan-sindh/';
  CropBookletsItem(this.id, this.title, this.subTitle, this.tileColor);

  void _displayScreen(BuildContext ctx, String tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 'b1') {
      launch(_urlWheat);
    }
    if (tileID == 'b2') {
      launch(_urlCotton);
    }
    if (tileID == 'b3') {
      launch(_urlRice);
    }
    if (tileID == 'b4') {
      launch(_urlDate);
    }
    if (tileID == 'b5') {
      launch(_urlBanana);
    }
    if (tileID == 'b6') {
      launch(_urlMaize);
    }
    if (tileID == 'b7') {
      launch(_urlMango);
    }
    if (tileID == 'b8') {
      launch(_urlOilSeeds);
    }
    if (tileID == 'b9') {
      launch(_urlGuava);
    }
    if (tileID == 'b10') {
      launch(_urlSugarcane);
    }
    if (tileID == 'b11') {
      launch(_urlCitrus);
    }
    if (tileID == 'b12') {
      launch(_urlSalt);
    }
    if (tileID == 'b13') {
      launch(_urlPotato);
    }
    if (tileID == 'b14') {
      launch(_urlVegi);
    }
    if (tileID == 'b15') {
      launch(_urlOrchard);
    }
    if (tileID == 'b16') {
      launch(_urlPunjab);
    }
    if (tileID == 'b17') {
      launch(_urlSindh);
    }
  }

  Image _cropImage(BuildContext ctx, String tileID) {
    if (tileID == 'b1') {
      return Image.asset(
        "assets/images/wheat.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b2') {
      return Image.asset(
        "assets/images/cotton.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b3') {
      return Image.asset(
        "assets/images/rice.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b4') {
      return Image.asset(
        "assets/images/date.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b5') {
      return Image.asset(
        "assets/images/banana.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b6') {
      return Image.asset(
        "assets/images/maize.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b7') {
      return Image.asset(
        "assets/images/mango.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b8') {
      return Image.asset(
        "assets/images/sunflower.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b9') {
      return Image.asset(
        "assets/images/guava.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b10') {
      return Image.asset(
        "assets/images/sugarcane.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b11') {
      return Image.asset(
        "assets/images/orange.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b12') {
      return Image.asset(
        "assets/images/salt.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b13') {
      return Image.asset(
        "assets/images/potato.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b14') {
      return Image.asset(
        "assets/images/vegetables.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b15') {
      return Image.asset(
        "assets/images/garden.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b16') {
      return Image.asset(
        "assets/images/fertility.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'b17') {
      return Image.asset(
        "assets/images/fertility.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    return Image.asset(
      "assets/images/wheat.png",
    );
  }

  @override
  Widget build(BuildContext context) {
    //we normally wrap container with GestureDetector or InkWell so that we may have
    //multiple listeners for tap, double tap etc.
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
            color: Colors.black,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Opacity(
                opacity: 0.3,
                child: Center(
                  child: _cropImage(context, id),
                ),
              ),
            ),
            // Container(
            //   height: 100,
            //   alignment: Alignment.center,
            //   padding: EdgeInsets.only(
            //     left: 4,
            //   ),
            //   child: Icon(
            //     Icons.grass_outlined,
            //     color: Colors.green.shade200,
            //     size: 84,
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(top: 7),
                  //width: MediaQuery.of(context).size.width * 0.6,
                  width: 170,
                  height: 50,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      //fontFamily: 'Urdu',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  color: Colors.transparent,
                  padding: const EdgeInsets.only(top: 10),
                  //width: MediaQuery.of(context).size.width * 0.6,
                  width: 170,
                  height: 60,
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: 'Urdu',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

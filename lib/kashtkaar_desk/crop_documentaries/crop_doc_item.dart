import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class CropDocumentItem extends StatelessWidget {
  final String id;
  final String title;
  final String subTitle;
  final Color tileColor;
  final _urlWheat = 'https://player.vimeo.com/video/480192034';
  final _urlCotton = 'https://player.vimeo.com/video/540031366';
  final _urlRice = 'https://player.vimeo.com/video/434261524';
  final _urlMaize = 'https://player.vimeo.com/video/524327257';
  final _urlSugarcane = 'https://player.vimeo.com/video/524125512';

  CropDocumentItem(this.id, this.title, this.subTitle, this.tileColor);

  void _displayScreen(BuildContext ctx, String tileID) {
    //Based on tile IDs, different screens are displayed
    if (tileID == 'd1') {
      launch(_urlWheat);
    }
    if (tileID == 'd2') {
      launch(_urlCotton);
    }
    if (tileID == 'd3') {
      launch(_urlRice);
    }
    if (tileID == 'd4') {
      launch(_urlMaize);
    }
    if (tileID == 'd5') {
      launch(_urlSugarcane);
    }
  }

  Image _cropImage(BuildContext ctx, String tileID) {
    if (tileID == 'd1') {
      return Image.asset(
        "assets/images/wheat.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'd2') {
      return Image.asset(
        "assets/images/cotton.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'd3') {
      return Image.asset(
        "assets/images/rice.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'd4') {
      return Image.asset(
        "assets/images/maize.png",
        // height: MediaQuery.of(ctx).size.height * 0.1,
        // width: MediaQuery.of(ctx).size.width * 0.1,
      );
    }
    if (tileID == 'd5') {
      return Image.asset(
        "assets/images/sugarcane.png",
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
          color: Colors.grey.shade200,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                        left: 4,
                      ),
                      child: Icon(
                        Icons.video_collection_outlined,
                        color: Colors.teal.shade600,
                        size: 44,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      color: Colors.transparent,
                      padding: const EdgeInsets.only(
                        right: 20,
                        top: 10,
                      ),
                      //width: MediaQuery.of(context).size.width * 0.6,
                      width: 170,
                      height: 100,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          //fontFamily: 'Urdu',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      color: Colors.transparent,
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      //width: MediaQuery.of(context).size.width * 0.6,
                      width: 170,
                      height: 100,
                      child: Text(
                        subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Urdu',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TaxScreenItem extends StatelessWidget {
  final String vcompany;
  final String vvalidity;
  final String vlink;

  TaxScreenItem(
    this.vcompany,
    this.vvalidity,
    this.vlink,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch(vlink);
      },
      child: Card(
        color: Colors.indigo.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Icon(
                        Icons.download_outlined,
                        size: 28,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        'Validity:',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        vvalidity,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

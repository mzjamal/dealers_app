import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class SonaUreaFertScreen extends StatelessWidget {
  static const routeName = '/fertSUrea';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/ffc.png',
              height: 40,
              width: 70,
              //fit: BoxFit.fill,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                'Fertilizers',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomeTabsScreen.routeName);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              MyColors.backgroundColor1,
              MyColors.backgroundColor2,
              MyColors.backgroundColor3,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              color: Colors.amber.shade400,
              width: MediaQuery.of(context).size.width,
              height: 55,
              child: Text(
                'سونا یوریا',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Urdu',
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Opacity(
                      opacity: 0.2,
                      child: Center(
                        child: Image.asset(
                          "assets/images/sonaurea.png",
                          height: double.infinity,
                          width: double.infinity,
                          //fit: BoxFit.fill,
                          //colorBlendMode: BlendMode.srcOver,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(
                            top: 20,
                            right: 20,
                            left: 10,
                          ),
                          width: double.infinity,
                          child: Text(
                            'سونا یوریا ایک نا ئٹروجنی کھا دہے جس میں نائٹروجن کی مقدارکسی بھی  دوسری کھادسے زیادہ یعنی ۴۶ فیصد ہے۔ نائٹروجن پودوں کیلئے ایک اہم غذاءی عنصر ہے۔ نائٹروجن پودے میں سبز مادہ(کلوروفل) بنانے میں اہم کردار ادا کرتی ہے جو ضیائ تالیف کیلئے انتہائ اہم ہے۔',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Urdu',
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(
                            top: 20,
                            right: 20,
                            left: 10,
                          ),
                          width: double.infinity,
                          child: Text(
                            'زراعت میں یوریا کا استعمال ناگزیر ہے اور اس کے بغیر فصلوں کی کاشت ناممکن ہے۔ یوریا کھاد کا استعمال فصلوں اور باغات کی نشونما بڑھانے کیلئےاقساط میں کیا جاتا ہے تاکہ مختلف مراحل پرفصل کو درکار نائٹروجن کی ضرورت کو پورا کیا جاسکے۔',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Urdu',
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(
                            top: 20,
                            right: 20,
                            left: 10,
                          ),
                          width: double.infinity,
                          child: Text(
                            'آبپاش علاقوں میں اس کے استعمال کے دوران نائٹروجن کے ضیاع کو روکنے کیلئے کھڑی فصل میں چھٹہ کے بعد فوراً پانی لگا دیا جاتا ہے۔ یوریا کو پانی لگانے کے بعد تر وتر حالت میں اور پانی میں حل کرکے بذریعہ آبپاشی بھی استعمال کیا جاسکتا ہے۔ علاوہ ازیں سونا یوریا کو بذریعہ سپرے بھی استعمال کیا جاتا ہے۔ سپرے کے ذریعے فوری اثر سے پودوں کی نشونما تیز ہو جاتی ہے۔ اس کا استعمال بذریعہ سپرے کرنے کیلئے سونا یوریا ۲ کلو گرام فی ۱۰۰ لٹر پانی استعمال کریں۔ بارانی علاقوں میں یوریا کا چھٹہ بارش سے پہلے کیا جاتا ہے تاکہ کھاد کا گیس کی شکل میں ضیاع کم ہو۔',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Urdu',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

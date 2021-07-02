import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class SonaZincFertScreen extends StatelessWidget {
  static const routeName = '/fertSonaZinc';
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
                'سونا زنک',
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
                          "assets/images/sonazinc.png",
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.8,
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
                            'زنک  نہ صرف پودوں کی خوراک کا اہم جزو ہے بلکہ انسانی صحت کو برقرار رکھنے میں  بھی اس کااہم کردار ہے۔ عالمی ادارہ صحت کے مطابق انسانی خوراک میں زنک کی کمی بہت  سی بیماریوں کا موجب ہے۔ پاکستان میں زنک کی کمی کی بڑی وجہ ہماری خوراک میں زنک کی مقدار کا کم ہونا ہے اور یہ مقدار اسی صورت پوری ہو سکتی ہے جب ہماری زمینوں میں اس کی کمی کو پورا کیا جاسکے۔ پاکستان کی تقریباً 85 فیصد زمینوں میں زنک کی کمی واقع ہو چکی ہے اسلئے ہماری زمینوں میں اس کا استعمال ناگزیر ہے۔ کھادوں کے متوازن استعمال کے فروغ کے سلسلہ میں فوجی فرٹیلائزر کمپنی لمیٹڈ نے اعلیٰ معیار کی  زنک  کاشتکار حضرات تک پہنچانے کا اہتمام کیا ہوا ہے۔',
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
                            'سونا زنک  (27فیصد زنک)  دانے دار حالت میں تین کلو گرام کے پیکٹ میں دستیاب ہے۔ سونا زنک سے پودوں کی بڑھوتری کا عمل متوازن انداز سے جاری رہتا ہے۔ سونا زنک پودوں میں ہارمون بنانے کے عمل کو تیز کرکے نشوونما میں اضافہ کرتا ہے۔ سونا زنک پودوں میں مختلف پروٹین بنانے میں اہم کردار ادا کرتا ہے ۔ سونا زنک فصل کو دباؤ سے بچا کر نئی کونپلوں کی نشوونما جاری رکھتا ہے۔ اس کے علاوہ یہ نائٹروجن اور فاسفورس کے استعمال کو بہتر کرنے میں معاونت کرتا ہے جو زیادہ پھول گڈی لانے کا باعث بنتا ہے۔',
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
                            'سونا زنک کو تمام کھادوں کے ساتھ  ملا کر بذریعہ چھٹہ، کیرا اورڈرم میں پانی میں حل کرکے بذریعہ آبپاشی دیا جا سکتا ہے۔',
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

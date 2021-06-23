import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class FfcSopFertScreen extends StatelessWidget {
  static const routeName = '/fertFfcSop';
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
                'ایف ایف سی ایس او پی',
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
                          "assets/images/ffcsop.png",
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
                            'پوٹاشیم  پودوں کیلئے ایک اہم غذائی جزو ہے یہ پودوں کے اندر نشاستہ بننے  کے عمل سے منسلک ہے۔ یہ پودوں میں تیار کردہ خوراک کو دیگر حصوں میں منتقل کرتا ہے۔ پھلوں اور شکر دار اجناس  کی مٹھاس میں اضافہ کرتا ہے۔ پوٹاشیم تنے کی مضبوطی میں اضافہ کرتا ہے او رفصل کو گرنے سے روکتا ہے۔ یہ فصل  میں بیماریوں اور کیڑے مکوڑوں وغیرہ کے اثرات سے بچنے کی صلا حیت پیدا کرتا ہے۔ فصل میں قوت مدافعت پیدا کرکے گرمی سردی،درجہ حرارت میں تبدیلی اور ناموافق موسمی حالات سے بچاتا ہے۔ پوٹاشیم پودوں کے قدوقامت، سبزیوں، پھلوں اور فصلوں کی کوالٹی (رنگت، سائز، خوشبو وغیرہ) کو بہتر کرنے کیلئے نہایت اہم ہے۔ پوٹاشیم پانی کی کمی یا سوکے کی حالت میں فصل کو مضر اثرات سے محفوظ رکھتا ہے اور عمل تبخیر کے ذریعے ہونے والے پانی کے ضیاع کو روکتا ہے۔ ',
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
                            'ایف ایف سی   ایس او پی کی بوری میں 50 فیصد پوٹاش (فی بوری 25 کلو گرام) کے علاوہ 18 فیصد سلفر (فی بوری 9 کلوگرام خالص سلفر) سلفیٹ حالت میں دستیاب  ہوتی ہے۔ ایف ایف سی ایس او پی کا استعمال ہر قسم کی زمین اور فصلات کیلئے موزوں ہے۔ ایف ایف سی ایس او پی کو دوسری کھادوں کے ساتھ ملا کر استعمال کیاجا سکتا ہے۔ باغات اور سبزیات میں ایس او پی کو ترجیح دیں جبکہ تمباکو کیلئے صرف ایس او پی کا ہی استعمال کریں۔ ایف ایف سی ایس اوپی کو چھٹہ کے علاوہ بذریعہ ڈرم آبپاشی کے ساتھ بھی استعمال کیا جا سکتا ہے اور اس صورت میں 10 کلو گرام ایف ایف سی ایس او پی کو 100 لٹر پانی میں حل کریں۔ایف ایف سی ایس اوپی کو بذریعہ سپرے پانی میں محلول بنا کر استعمال کیا جا سکتا ہے۔ اس کیلئے 2 کلوگرام ایف ایف سی ایس او پی100 لٹر پانی میں حل کر کے سپرے کریں۔',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Urdu',
                            ),
                          ),
                        ),
                        // Container(
                        //   alignment: Alignment.topRight,
                        //   padding: EdgeInsets.only(
                        //     top: 20,
                        //     right: 20,
                        //     left: 10,
                        //   ),
                        //   width: double.infinity,
                        //   child: Text(
                        //     'فوجی فرٹیلائزر کمپنی لمیٹڈ کی درآمد کردہ ایف ایف سی ڈی اے پی اور فوجی فرٹیلائزر بن قاسم لمیٹڈ کی تیار کردہ سوناڈی اے پی، جو پاکستان میں تیار کردہ واحد ڈی اے پی کھاد ہے، اپنے اعلٰی معیار کی وجہ سے کاشتکاروں میں بہت مقبول ہے۔ فاسفورس اور ناءٹروجن کی پوری مقدار، دانے کی بہترین جسامت اور دیگر خوبیوں کی بنا پر سونا/ ایف ایف سی ڈی اے پی بہترین نتائج کی حامل کھادیں ہیں۔ ',
                        //     textAlign: TextAlign.right,
                        //     style: TextStyle(
                        //       fontSize: 24,
                        //       fontFamily: 'Urdu',
                        //     ),
                        //   ),
                        // ),
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

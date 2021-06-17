import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class FfcDapFertScreen extends StatelessWidget {
  static const routeName = '/fertFfcDap';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Row(
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
                'ایف ایف سی ڈی اے پی',
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
                          "assets/images/ffcdap.png",
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
                            'ڈائ امونیم فاسفیٹ(ڈی اے پی) کا تعلق پانی میں حل پانی میں حل پذیر امونیم فاسفیٹ سے ہے جو امونیا اور فاسفورک ایسڈ کے تعامل سے بنتی ہے۔ ڈی اے پی میں تمام فاسفورسی کھادوں کی نسبت غذاءی اجزاء یعنی ۴۶ فیصد فاسفیٹ اور ۱۸ فیصد ناءٹروجن پائ جاتی ہے اور ۵۰ کلو گرام کی ایک بوری میں غذائ اجزاء کی مقدار ۳۲ کلو گرام ہوتی ہے۔ تمام فصلات کیلئے ڈی اے پی کی سفارش بواءی کے وقت پر کی جاتی ہے تاکہ جڑوں کی نشونما اور پھیلاؤ بہتر ہو سکے اور پودوں کو بر وقت توانائ مہیا ہو۔',
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
                            ' ڈی اے پی کھاد غذائ اجزاء کی زیادہ مقدار ہونے کی وجہ سے ایک طاقتور کھاد ہے اور غذائ اجزاء بالخصوص فاسفورس کیلئے نہایت اہم جزو ہے۔ فاسفورس سے دانہ جسامت میں بڑا اور وزن دار بنتا ہے جس سے پیداوار میں خاطر خواہ اضافہ ہوتا ہے۔ فاسفورس فصل کے بروقت تیار ہونے میں بھی معاون ہے۔ ڈی اے پی کھاد کے استعمال کے بغیر فصلوں کی زیادہ پیداوار کا حصول ممکن نہیں اس لئے پیداوار میں اضافہ کیلئے ڈی اے پی کا استعمال ناگزیر ہو چکا ہے۔ ملک میں دستیاب تمام فاسفورسی کھادوں کی نسبت ڈی اے پی کی حل پذیری سب سے زیادہ یعنی ۹۰ فیصد سے زائد ہے اس لئے اس کا استعمال بجائ کے بعد ڈرم میں حل کرکے بذریعہ آبپاشی بھی کیا جاسکتا ہے۔',
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
                            'فوجی فرٹیلائزر کمپنی لمیٹڈ کی درآمد کردہ ایف ایف سی ڈی اے پی اور فوجی فرٹیلائزر بن قاسم لمیٹڈ کی تیار کردہ سوناڈی اے پی، جو پاکستان میں تیار کردہ واحد ڈی اے پی کھاد ہے، اپنے اعلٰی معیار کی وجہ سے کاشتکاروں میں بہت مقبول ہے۔ فاسفورس اور ناءٹروجن کی پوری مقدار، دانے کی بہترین جسامت اور دیگر خوبیوں کی بنا پر سونا/ ایف ایف سی ڈی اے پی بہترین نتائج کی حامل کھادیں ہیں۔ ',
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

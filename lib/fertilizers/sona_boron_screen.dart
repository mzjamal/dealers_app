import 'package:flutter/material.dart';
import '../home/home_tabs_screen.dart';
import '../colors.dart';

class SonaBoronFertScreen extends StatelessWidget {
  static const routeName = '/fertSonaBoron';
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
                'سونا بوران',
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
                          "assets/images/sonaboron.png",
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
                            'بوران اجزائے صغیرہ ہے اور پاکستان کی زمینوں میں اس کی بڑھتی ہوئی کمی کے پیش نظر کمپنی سونا بوران کے نام سے یہ کھاد کاشتکاروں تک  پہنچا رہی ہے۔فوجی فرٹیلائزر کمپنی لمیٹڈ یہ کھاد بوریکس کی شکل میں3کلو گرام کے پیکٹ میں کاشتکار حضرات کو فراہم کر رہی ہے  جس میں 10.5فیصد بوران ہوتا ہےجو فصلوں کی نشوونما، بڑھوتری اور پیداوار میں اضافے کیلئے نہایت اہم جزو ہے۔ پھولوں، سٹوں کی بارآوری میں بوران کا اہم کردار ہے جس سے پیداوار میں یقینی اضافہ ہوتا ہے۔ ',
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
                            ' سونا بوران  کے استعمال سےکپاس میں گڈیاں، پھول اور ٹینڈے زیادہ بنتے ہیں اور کیرے کا عمل کم ہو جاتا ہے۔ سونا بوران عمل زیرگی میں بہتری لاکر پھل کی تعداد، جسامت اور وزن میں اضافہ کرتا ہے۔ سونا بوران کا استعمال پھل دار درختوں میں چھال کو مضبوط بنانے کے ساتھ ساتھ پھل کو پھٹنے سے بھی روکتا ہے۔ سونا بوران سبزیوں کی شکل اور وضع میں بہتری لاکر ان کے معیار کو بہتر کرتا ہے۔ سونا بوران کے استعمال سے پتوں میں تیار خوراک کی ٹینڈوں ، سٹوں ، مونجروں اور پودوں کے دیگر حصوں کی طرف ترسیل کا عمل بہتر ہوتا ہے۔سونا بوران کاا ستعمال  دوسری کھادوں کے ساتھ کیا جا سکتا ہے۔',
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

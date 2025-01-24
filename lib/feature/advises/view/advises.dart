import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Advises extends StatelessWidget {
  @override
  var currentuser = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        backgroundColor: Colors.pink.shade700,
        centerTitle: true,
        title: Text(
          "نصائح",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. تناول الغذاء الصحي:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'يُفضل تناول نظام غذائي متوازن يحتوي على مجموعة متنوعة من الفواكه والخضروات والحبوب الكاملة والبروتينات الصحية مثل اللحوم الخالية من الدهون والأسماك والمكسرات والبذور.',
            ),
            SizedBox(height: 10.0),
            Text(
              '2. ممارسة الرياضة بانتظام:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'حافظ على نشاط جسدي منتظم، فهو يعزز اللياقة البدنية ويحسن المزاج ويقلل من مخاطر الإصابة بالأمراض المزمنة.',
            ),
            SizedBox(height: 10.0),
            Text(
              '3. النوم الجيد:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'يُوصى بالحصول على 7-9 ساعات نوم جيدة في الليل، حيث يساعد النوم الكافي على استعادة الطاقة وتجديد الجسم وتعزيز الصحة العامة.',
            ),
            SizedBox(height: 10.0),
            Text(
              '4. تقليل التوتر وإدارة الضغوط النفسية:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'تعلم تقنيات التنفس العميق والتأمل وممارسة الهوايات التي تساعد على الاسترخاء والتخلص من التوتر.',
            ),
            SizedBox(height: 10.0),
            Text(
              '5. الاستماع إلى جسدك والتفاعل مع العلامات الخاصة به:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'قم بزيارة الطبيب بانتظام لفحص الصحة العامة والكشف عن أي مشاكل صحية محتملة في وقت مبكر.',
            ),
            SizedBox(height: 10.0),
            Text(
              '6. تجنب العادات الضارة:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'قلل من تعاطي الكحول والتدخين، وتجنب تعاطي المخدرات.',
            ),
            SizedBox(height: 10.0),
            Text(
              '7. الابتعاد عن العوامل البيئية الضارة:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'حافظ على بيئة نظيفة وصحية، وتجنب التعرض للتلوث الهوائي والمواد الكيميائية الضارة قدر الإمكان.',
            ),
            SizedBox(height: 10.0),
            Text(
              '8. التواصل الاجتماعي والدعم النفسي:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'قم ببناء علاقات اجتماعية صحية وابحث عن الدعم النفسي عند الحاجة.',
            ),
            SizedBox(height: 10.0),
            Text(
              'للمشاكل الصحية الخاصة، يُنصح دائمًا بالتحدث مع الطبيب المؤهل الذي يمكنه تقديم المشورة الطبية الشخصية والمناسبة.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

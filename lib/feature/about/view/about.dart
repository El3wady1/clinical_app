import 'package:appnote/core/utils/mediaquery.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MediaQueryUI.isMobile(context)? AppBar(
        centerTitle: true,
        title: Text(":  عن التطبيق  ",style: TextStyle(fontWeight: FontWeight.w900),),
        flexibleSpace: WidgetsStyles.AppbarStylee,
      ):null,
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'حجز الدكتور عبر الإنترنت أصبح خيارًا شائعًا ومفيدًا للكثيرين في الوقت الحالي. يعتبر هذا النهج أكثر راحة للمرضى الذين يبحثون عن الرعاية الطبية دون الحاجة للانتقال إلى العيادة. من بين المزايا الرئيسية لحجز دكتور أونلاين، يشمل الوصول السهل إلى خدمات الرعاية الصحية دون الحاجة للتنقل في حركة المرور أو الانتظار في الصفوف. يمكن للمرضى أيضًا الاستفادة من توفر العديد من الأطباء والاختصاصيين عبر الإنترنت، مما يتيح لهم الاختيار من بين مجموعة واسعة من الممارسين الصحيين دون قيود جغرافية. بالإضافة إلى ذلك، فإن الحجز عبر الإنترنت يوفر فرصة للمرضى للحصول على استشارات سريعة ومواعيد تناسب جدولهم اليومي بشكل أفضل. ومع ذلك، يجب على المرضى الانتباه إلى أن بعض الحالات قد تتطلب تقييمًا ومعالجة شخصية وجها لوجه، وفي هذه الحالات قد يكون من الأفضل اللجوء إلى الطبيب في العيادة الطبية التقليدية.',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
              ),
            ),
            Center(
                child: Text(
              ":  مطــور التطبيق  ",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w900,color:Colors.red.shade900  ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("محمود جمال العوضي ",textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    clipBehavior: Clip.hardEdge,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: Image.asset("assets/images/me.jpg"),
                    ),
                  ),
                ),

              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: Lottie.asset("assets/animations/you.json"),
                ),
              ),
                Text("Elawady Tv",textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
                ),


              ],),
          ],
        ),
      ),
    );
  }
}

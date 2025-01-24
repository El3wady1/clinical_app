import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Container(
        decoration: BoxDecoration(
          gradient: WidgetsStyles.buttonhomestyle,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/animations/m.json",width: MediaQuery.of(context).size.height*0.5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                    " تطبيق العيادة الإلكترونية ",
                    style: TextStyle(
                        fontSize: 25, color: Colors.white, fontWeight: FontWeight.w900),

                  )),
            ),
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign:TextAlign.center,
                    " هو منصة تقنية تتيح للمرضى الحصول على خدمات صحية عبر الإنترنت",
                    style: TextStyle(
                        fontSize: 17, color: Colors.yellow, fontWeight: FontWeight.w900),

                  ),
                )),
          ],
        ),
      ),
    );
  }
}

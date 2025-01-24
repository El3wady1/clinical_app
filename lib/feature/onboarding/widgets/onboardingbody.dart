import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/login/view/LogInScreen.dart';
import 'package:appnote/feature/onboarding/onboard1.dart';
import 'package:appnote/feature/onboarding/onboard2.dart';
import 'package:appnote/feature/onboarding/onboard3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBodyView extends StatelessWidget {
  PageController _controllerpage = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Container(
        decoration: BoxDecoration(
          gradient: WidgetsStyles.buttonhomestyle,
        ),
        child: Stack(children: [
          PageView(
            onPageChanged: (i) {
              index = i;
            },
            controller: _controllerpage,
            children: [
              OnboardingPage1(),
              OnboardingPage2(),
              OnboardingPage3(),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    onTap: () {
                      //0,1,2
                      _controllerpage.jumpToPage(3);
                    },
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  SmoothPageIndicator(controller: _controllerpage, count: 3),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    onTap: () {
                      var x = _controllerpage.nextPage(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeIn);
                      if (index == 2) {
                        Routting.pushreplaced(context, Login());
                        print(_controllerpage.page);
                      }
                    },
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}

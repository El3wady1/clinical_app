import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/bottomnavbar/widget/homebody_view.dart';
import 'package:appnote/feature/controller/cubite_homeview_cubit.dart';
import 'package:appnote/feature/home/view/home.dart';
import 'package:appnote/feature/login/view/LogInScreen.dart';
import 'package:appnote/feature/onboarding/onboardingview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  var currentuser = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    currentuser != null ? islogin = true : islogin = false;
    return AnimatedSplashScreen(
        duration: 2000,
        splashIconSize: screenHeight * 8,
        splash: Container(
          decoration: BoxDecoration(
            gradient: WidgetsStyles.buttonhomestyle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/animations/br.json",width: MediaQuery.of(context).size.height*0.5),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                      ("عيادة اونلاين"),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 35),
                    )),
              )
            ],
          ),
        ),
        nextScreen: islogin == true
            ? BlocProvider(
          create: (context) => HomeviewCubite(),
          child: BottomnavSelection(),
        )
        // Homepage(
        //         name: 'Patiant Email',
        //         email: '${currentuser?.email}',
        //       )
            : Login(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue.shade900);
  }
}

bool? islogin;

var currentuser = FirebaseAuth.instance.currentUser;

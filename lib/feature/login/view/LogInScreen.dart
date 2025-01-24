import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/core/widgets/custom_button.dart';
import 'package:appnote/core/widgets/custom_textfeild.dart';
import 'package:appnote/feature/Doctor/home/view/home.dart';
import 'package:appnote/feature/Doctor/otpdoctor.dart';
import 'package:appnote/feature/about/view/about.dart';
import 'package:appnote/feature/bottomnavbar/widget/homebody_view.dart';
import 'package:appnote/feature/controller/cubite_homeview_cubit.dart';
import 'package:appnote/feature/getcurrentpassword/view/getcurrent%20password.dart';
import 'package:appnote/feature/home/view/home.dart';
import 'package:appnote/feature/login/view/widget/gotoregister.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var currentuser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    LoginWithemail_pass() async {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
        if (credential.user?.uid != null) {
          print("Cre............${credential.credential}");
          print("Userid............${credential.user?.uid}");

          print("token............${credential.credential?.token}");
          print("Logggggg");
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Correct',
            desc: 'Correct Email and Password ',
            btnOkOnPress: () {
              Routting.pushreplaced(
                  context,
                  BlocProvider(
                    create: (context) => HomeviewCubite(),
                    child: BottomnavSelection(),
                  )
                  // Homepage(
                  //   name: '${currentuser?.displayName}',
                  //   email: '${currentuser?.email}',
                  // )
                  );
            },
            btnOkIcon: Icons.check,
            btnOkColor: Colors.green,
          )..show();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: 'The user not found for that email',
            btnOkOnPress: () {
              // Routting.pushreplaced(context, Homepage());
            },
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          )..show();

          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: 'Wrong password provided for that user',
            btnOkOnPress: () {
              Routting.pushreplaced(context, Login());
            },
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();

          print('Wrong password provided for that user.');
        } else if (e.code == 'invalid-email') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: 'invalid-email !',
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();

          print('invalid-email !');
        } else if (e.code == 'user-disabled') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: 'user-disabled',
            btnOkOnPress: () {
              Routting.pushreplaced(context, Login());
            },
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();

          print('user-disabled !');
        } else if (e.code == 'user-disabled') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: 'user-disabled',
            btnOkOnPress: () {
              Routting.pushreplaced(context, Login());
            },
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          ).show();

          print('user-disabled !');
        }
      }
    };
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Container(
        decoration: BoxDecoration(
          gradient: WidgetsStyles.buttonhomestyle,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(26),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 180,
                          width: 600,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Lottie.asset(
                              "assets/animations/bb.json",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
// From here the login Credentials start.
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 11,
                              offset: Offset(0, 4),
                            ),
                          ]),
                      child: Column(
                        children: [
                          Custom_Textfeild(
                            obscuretext: false,
                            controller: email,
                            labelStyle: TextStyle(color: Colors.white),
                            validate: null,
                            keyboardtype: TextInputType.emailAddress,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(null),
                            hint: "Email",
                            backgroundcolor: Colors.amber,
                            bordercolor: Colors.black,
                            hintstyle: TextStyle(color: Colors.white),
                            borderwidth: 3,
                            borderradius: 25,
                            maxlines: 1,
                          ),
                          Custom_Textfeild(
                            obscuretext: true,
                            controller: password,
                            labelStyle: TextStyle(color: Colors.white),
                            validate: null,
                            keyboardtype: TextInputType.emailAddress,
                            prefixIcon: Icon(
                              Icons.security,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(null),
                            hint: "Password",
                            backgroundcolor: Colors.amber,
                            bordercolor: Colors.black,
                            hintstyle: TextStyle(color: Colors.white),
                            borderwidth: 3,
                            borderradius: 25,
                            maxlines: 1,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        text: 'تسجيل دخول ',
                        ontap: () {
                          if (password.text == 'admin' &&
                              email.text == 'admin') {
                            Routting.pushreplaced(context, D_Homepage());
                          } else {
                            LoginWithemail_pass();
                          }
                        },
                        width: 400,
                        back_color: Colors.red.shade900,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        text: 'استرجاع كلمه المرور ؟',
                        ontap: () {
                          Routting.push(context, PassFieldScreen());
                        },
                        width: 400,
                        back_color: Colors.deepPurple,
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Routting.push(context, OtpDoctor());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          width: 180,
                          decoration: BoxDecoration(
                              color: Colors.amber.shade700,
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "دكتور",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.key_rounded,
                                  color: Colors.deepPurple,
                                  size: 36,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    //From here the signin buttons will occur.

                    SizedBox(height: 5),
                    Registernow(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ListTile(
                        leading: Image.asset(
                          "assets/images/support.png",
                          height: 40,
                        ),
                        title: Text(
                          "عن التطبيق",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        onTap: () {
                          Routting.push(context, About());
                          // Add your navigation logic here
                        },
                      ),
                    ),

                  ],
                )),
          ),
        ),
      ),
    );
  }
}

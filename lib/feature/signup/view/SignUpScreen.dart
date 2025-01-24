import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/core/widgets/custom_button.dart';
import 'package:appnote/core/widgets/custom_textfeild.dart';
import 'package:appnote/feature/login/view/LogInScreen.dart';
import 'package:appnote/feature/signup/services/add.dart';
import 'package:appnote/feature/signup/services/consaltservice.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/mediaquery.dart';

class SignUp extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignupWithemail_pass() async {
      try {
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        print(credential);
        print("-------------------------");

        if (credential.user?.uid != null) {
          print("token .............${credential.credential?.token}");

          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Susccs',
            desc: 'Account Craeted , Go to Login ?',
            btnOkOnPress: () {
              AddData(
                userid: credential.user!.uid,
                name: name.text,
                email: email.text,
                age: age.text,
                phone: phone.text,
                adress: adress.text,
                pass:password.text
              );
              MakeConsalt(context: context, uid:  credential.user!.uid);



              Routting.pushreplaced(context, Login());
            },
            btnOkIcon: Icons.check,
            btnOkColor: Colors.green,
          ).show();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: 'The password provided is too weak.',
            btnOkOnPress: () {
              Routting.pushreplaced(context, SignUp());
            },
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          )..show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: 'The account already exists for that email !',
            btnOkOnPress: () {
              Routting.pushreplaced(context, SignUp());
            },
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          )..show();
          print('The account already exists for that email.');
        } else if (e.code == 'invalid-email') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: 'invalid-email !',
            btnOkOnPress: () {
              Routting.pushreplaced(context, SignUp());
            },
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          )..show();
        } else if (e.code == 'operation-not-allowed') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            headerAnimationLoop: false,
            title: 'Error',
            desc: 'This Operation-not-allowed !',
            btnOkOnPress: () {
              Routting.pushreplaced(context, SignUp());
            },
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.red,
          )..show();
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Container(
        decoration: BoxDecoration(
          gradient: WidgetsStyles.buttonhomestyle,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        child: Column(
                          children: [
                            Stack(
                              children: <Widget>[
                                MediaQueryUI.isMobile(context)?    Positioned(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Lottie.asset(
                                        "assets/animations/s.json"),
                                  ),
                                ):Container(),
                              ],
                            ),

                            //The Username,Email,Password Input fields.
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
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
                                    controller: name,
                                    labelStyle: TextStyle(),
                                    validate: null,
                                    keyboardtype: TextInputType.text,
                                    prefixIcon: Icon(Icons.person),
                                    suffixIcon: Icon(null),
                                    hint: "Name",
                                    backgroundcolor: Colors.amber,
                                    bordercolor: Colors.black,
                                    hintstyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                    borderwidth: 4,
                                    borderradius: 20,
                                    maxlines: 1,
                                  ),
                                  Custom_Textfeild(
                                    obscuretext: false,
                                    controller: age,
                                    labelStyle: TextStyle(),
                                    validate: null,
                                    keyboardtype: TextInputType.text,
                                    prefixIcon: Icon(Icons.accessibility_sharp),
                                    suffixIcon: Icon(null),
                                    hint: "Age",
                                    backgroundcolor: Colors.amber,
                                    bordercolor: Colors.black,
                                    hintstyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                    borderwidth: 4,
                                    borderradius: 20,
                                    maxlines: 1,
                                  ),
                                  Custom_Textfeild(
                                    obscuretext: false,
                                    controller: phone,
                                    labelStyle: TextStyle(),
                                    validate: null,
                                    keyboardtype: TextInputType.text,
                                    prefixIcon: Icon(Icons.phone),
                                    suffixIcon: Icon(null),
                                    hint: "Phone Number",
                                    backgroundcolor: Colors.amber,
                                    bordercolor: Colors.black,
                                    hintstyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                    borderwidth: 4,
                                    borderradius: 20,
                                    maxlines: 1,
                                  ),
                                  Custom_Textfeild(
                                    obscuretext: false,
                                    controller: adress,
                                    labelStyle: TextStyle(),
                                    validate: null,
                                    keyboardtype: TextInputType.text,
                                    prefixIcon: Icon(Icons.phone),
                                    suffixIcon: Icon(null),
                                    hint: "Adress",
                                    backgroundcolor: Colors.amber,
                                    bordercolor: Colors.black,
                                    hintstyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                    borderwidth: 4,
                                    borderradius: 20,
                                    maxlines: 1,
                                  ),
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
                                    hintstyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
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
                                    backgroundcolor: Colors.cyan,
                                    bordercolor: Colors.black,
                                    hintstyle: TextStyle(color: Colors.white),
                                    borderwidth: 3,
                                    borderradius: 25,
                                    maxlines: 1,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      //Raised Buttons of sigup will appear.
                      CustomButton(
                        text: 'انشـــاء حساب',
                        ontap: () async {
                          SignupWithemail_pass();
                        },
                        width: 400,
                        back_color: Colors.red.shade900,
                      ),

                      SizedBox(height: 25),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "لدي اكونت بالفعل !",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () async {
                                Routting.pushreplaced(context, Login());
                              },
                              child: Container(
                                child: Text("تسجيل دخول ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                        fontSize: 18)),
                              ),
                            )
                          ]),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

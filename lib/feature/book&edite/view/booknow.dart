import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/mediaquery.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/core/widgets/custom_button.dart';
import 'package:appnote/core/widgets/showsnackbar.dart';
import 'package:appnote/feature/book&edite/services/addbook.dart';
import 'package:appnote/feature/home/view/widget/navbarweb.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/widgets/custom_textfeild.dart';

class Book_Painent extends StatelessWidget {
  TextEditingController hproblem = TextEditingController();
  TextEditingController agree = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MediaQueryUI.isMobile(context) ?AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        automaticallyImplyLeading: true,

        backgroundColor: Colors.pink.shade700,
        centerTitle: true,
        title: Text(
          "حجز الان",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ):null,
      bottomNavigationBar: CustomButton(
          back_color: Colors.pink.shade900,
          text: "Submit",
          ontap: () async {
            var userid = await FirebaseAuth.instance.currentUser?.uid;

            if (formkey.currentState!.validate()) {
              try {
                AddStudentBook(
                    userid: userid!, book: agree.text, problem: hproblem.text);
                showTrueSnackBar(
                    context: context,
                    message: "تم الحجز بنجاح ",
                    icon: Icons.check_circle);
                Routting.popNoRoute(context);
              } catch (e) {
                showfalseSnackBar(
                    context: context, message: "فشل الحجز", icon: Icons.cancel);
              }
            }
          },
          width: 300),
      body: Container(
        decoration: BoxDecoration(gradient: WidgetsStyles.buttonhomestyle),
        child: Form(
          key: formkey,
          child: Stack(
            children: [

              MediaQueryUI.isMobile(context) ?  ListView(
                children: [
                  Lottie.asset("assets/animations/s.json",),
                  SizedBox(
                    height: 20,
                  ),
                  Custom_Textfeild(
                    obscuretext: false,
                    controller: hproblem,
                    labelStyle: TextStyle(),
                    validate: (d) {
                      if (d.length < 8) {
                        return "يرجي ادخال اكثر من 20 حرف علي الاقل";
                      }
                    },
                    keyboardtype: TextInputType.text,
                    prefixIcon: Icon(Icons.report_problem_outlined),
                    suffixIcon: Icon(null),
                    hint: "ماهي المشكله لديك",
                    backgroundcolor: Colors.white,
                    bordercolor: Colors.black,
                    hintstyle: TextStyle(),
                    borderwidth: 4,
                    borderradius: 20,
                    maxlines: 6,
                  ),
                  Custom_Textfeild(
                    obscuretext: false,
                    controller: agree,
                    labelStyle: TextStyle(),
                    validate: (f) {
                      if (f != "حجز") {
                        return "  اكد الحجز بادخال كلمه 'حجز'   ";
                      }
                    },
                    keyboardtype: TextInputType.text,
                    prefixIcon: Icon(Icons.add_reaction_sharp),
                    suffixIcon: Icon(null),
                    hint: "للتاكيد ... اكتب كلمه حجز ",
                    backgroundcolor: Colors.white,
                    bordercolor: Colors.black,
                    hintstyle: TextStyle(),
                    borderwidth: 4,
                    borderradius: 20,
                    maxlines: 1,
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ):Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.2,
                    ),
                    Custom_Textfeild(
                      obscuretext: false,
                      controller: hproblem,
                      labelStyle: TextStyle(),
                      validate: (d) {
                        if (d.length < 8) {
                          return "يرجي ادخال اكثر من 20 حرف علي الاقل";
                        }
                      },
                      keyboardtype: TextInputType.text,
                      prefixIcon: Icon(Icons.report_problem_outlined),
                      suffixIcon: Icon(null),
                      hint: "ماهي المشكله لديك",
                      backgroundcolor: Colors.white,
                      bordercolor: Colors.black,
                      hintstyle: TextStyle(),
                      borderwidth: 4,
                      borderradius: 20,
                      maxlines: 6,
                    ),
                    Custom_Textfeild(
                      obscuretext: false,
                      controller: agree,
                      labelStyle: TextStyle(),
                      validate: (f) {
                        if (f != "حجز") {
                          return "  اكد الحجز بادخال كلمه 'حجز'   ";
                        }
                      },
                      keyboardtype: TextInputType.text,
                      prefixIcon: Icon(Icons.add_reaction_sharp),
                      suffixIcon: Icon(null),
                      hint: "للتاكيد ... اكتب كلمه حجز ",
                      backgroundcolor: Colors.white,
                      bordercolor: Colors.black,
                      hintstyle: TextStyle(),
                      borderwidth: 4,
                      borderradius: 20,
                      maxlines: 1,
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              MediaQueryUI.isMobile(context)?Container():NavWeb(),

            ],
          ),
        ),
      ),
    );
  }
}

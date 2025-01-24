
import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/Doctor/home/view/home.dart';
import 'package:appnote/feature/login/view/LogInScreen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class OtpDoctor extends StatelessWidget {
  const OtpDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        backgroundColor: Colors.pink.shade700,
        elevation: 0,
      ),
      backgroundColor: Colors.blue.shade700,
      body: Container(
        decoration: BoxDecoration(
          gradient: WidgetsStyles.buttonhomestyle,
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "برجاء ادخال الرقم السري   ؟",
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 30,),
            OtpTextField(
              textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),
              showCursor: true,
              fieldWidth: 47,
              keyboardType: TextInputType.text,
              borderWidth: 5,
              borderRadius: BorderRadius.circular(10),
              filled: true,
              fillColor: Colors.white,
              clearText: true,
              numberOfFields: 5,
              borderColor: Colors.black,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                if(verificationCode=="admin"){
                  Routting.pushreplaced(context, D_Homepage());
                }else{
                  AwesomeDialog(
                    btnOkIcon: Icons.check_circle_outline_rounded,
                    btnOkOnPress: () {
                                Routting.pushreplaced(context, OtpDoctor());
                    },
                    context: context,
                    dialogType: DialogType.question,
                    animType: AnimType.rightSlide,
                    headerAnimationLoop: false,
                    title: '',
                    desc: 'الرقم السري خطأ',
                    descTextStyle: TextStyle(fontSize: 35),

                    btnOkColor: Colors.red,
                  ).show();
               }
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}

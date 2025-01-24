import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/core/widgets/custom_button.dart';
import 'package:appnote/core/widgets/showsnackbar.dart';
import 'package:appnote/feature/profile/services/updateprofileservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_textfeild.dart';

class Editeprofile extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController pnumber = TextEditingController();
  TextEditingController adress = TextEditingController();
  var keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        centerTitle: true,
        title: Text(
          "تعديل الحساب الشخصي ",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      bottomNavigationBar: CustomButton(
          back_color: Colors.pink.shade900,
          text: "Submit",
          ontap: () {
         if(keyform.currentState!.validate()){
           var userid = FirebaseAuth.instance.currentUser?.uid;
           UpdateProfieData(
               userid: userid!,
               name: name.text,
               age: age.text,
               phone: pnumber.text,
               adress: adress.text);
           showTrueSnackBar(
               context: context,
               message: "تم التعديل بنجاح ",
               icon: Icons.check_circle);

           Routting.popNoRoute(context);
         }
          },
          width: 300),
      body: Form(
        key: keyform,
        child: Container(
          decoration: BoxDecoration(
            gradient: WidgetsStyles.buttonhomestyle,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Custom_Textfeild(
                obscuretext: false,
                controller: name,
                labelStyle: TextStyle(),
                validate: (d){
                  if(d.length<10){
                    return "ادخل اسمك كامل";
                  }
                },
                keyboardtype: TextInputType.text,
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(null),
                hint: "الاسم كامل بالعربي",
                backgroundcolor: Colors.white,
                bordercolor: Colors.black,
                hintstyle: TextStyle(),
                borderwidth: 4,
                borderradius: 20,
                maxlines: 2,
              ),
              Custom_Textfeild(
                obscuretext: false,
                controller: age,
                labelStyle: TextStyle(),
                validate: (x){
                  if(x.isEmpty){
                    return "ادخل العمر";
                  }
                },
                keyboardtype: TextInputType.text,
                prefixIcon: Icon(Icons.accessibility_sharp),
                suffixIcon: Icon(null),
                hint: "السن",
                backgroundcolor: Colors.white,
                bordercolor: Colors.black,
                hintstyle: TextStyle(),
                borderwidth: 4,
                borderradius: 20,
                maxlines: 1,
              ),
              Custom_Textfeild(
                obscuretext: false,
                controller: pnumber,
                labelStyle: TextStyle(),
                validate: (p){
                  if(p.length<10){
                    return "ادخل رقم الهاتف ";
                  }
                },
                keyboardtype: TextInputType.text,
                prefixIcon: Icon(Icons.phone),
                suffixIcon: Icon(null),
                hint: "رقم الهاتف",
                backgroundcolor: Colors.white,
                bordercolor: Colors.black,
                hintstyle: TextStyle(),
                borderwidth: 4,
                borderradius: 20,
                maxlines: 1,
              ),
              Custom_Textfeild(
                obscuretext: false,
                controller: adress,
                labelStyle: TextStyle(),
                validate: (a){
                  if(a.length<7){
                    return "ادخل عنوانك";
                  }
                },
                keyboardtype: TextInputType.text,
                prefixIcon: Icon(Icons.add_reaction_sharp),
                suffixIcon: Icon(null),
                hint: "عنوانك كامل",
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
      ),
    );
  }
}

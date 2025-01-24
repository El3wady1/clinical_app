import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/signup/services/add.dart';
import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/widgets/custom_button.dart';
import 'package:appnote/core/widgets/custom_textfeild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../repo/updateoffers.dart';

class Offers extends StatelessWidget {
  TextEditingController offertext = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override


  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        centerTitle: true,
        title: Text(
          "اضافه عرض",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      bottomNavigationBar: CustomButton(
          back_color: Colors.pink.shade900,
          text: "Submit",
          ontap: () async {
            var x = offertext;

            if (formkey.currentState!.validate()) {
               updateDataOffers(con_offer: offertext.text);
               Routting.popNoRoute(context);

            }
          },
          width: 300),
      body: Container(
        decoration: BoxDecoration(gradient: WidgetsStyles.buttonhomestyle),
        child: Form(
          key: formkey,
          child: Center(
            child: ListView(
              children: [
                Lottie.asset("assets/animations/m.json"),
                SizedBox(
                  height: 50,
                ),
                Custom_Textfeild(
                    maxlines: 7,
                    obscuretext: false,
                    controller: offertext,
                    labelStyle: TextStyle(),
                    validate: (data) {
                      if (data.length < 50) {
                        return " يرجي اضافة حروف تتخطي 50 حرف";
                      }
                    },
                    keyboardtype: TextInputType.text,
                    prefixIcon: Icon(Icons.local_offer_outlined),
                    suffixIcon: Icon(null),
                    hint: "  اضافه عرض الي المرضي",
                    backgroundcolor: Colors.white,
                    bordercolor: Colors.black,
                    hintstyle: TextStyle(),
                    borderwidth: 4,
                    borderradius: 20),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

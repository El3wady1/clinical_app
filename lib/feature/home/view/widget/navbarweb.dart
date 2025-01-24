import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/mediaquery.dart';
import 'package:appnote/core/widgets/custom_button.dart';
import 'package:appnote/core/widgets/custom_textfeild.dart';
import 'package:appnote/core/widgets/showsnackbar.dart';
import 'package:appnote/feature/advises/view/advises.dart';
import 'package:appnote/feature/book&edite/view/booknow.dart';
import 'package:appnote/feature/bottomnavbar/widget/homebody_view.dart';
import 'package:appnote/feature/chat/view/chats.dart';
import 'package:appnote/feature/history/view/history.dart';
import 'package:appnote/feature/home/view/webhome.dart';
import 'package:appnote/feature/login/view/LogInScreen.dart';
import 'package:appnote/feature/profile/services/displayprofile.dart';
import 'package:appnote/feature/profile/services/updateprofileservices.dart';
import 'package:appnote/feature/profile/view/profile.dart';
import 'package:appnote/feature/statusbook/view/statusbook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgetsstyle.dart';

class NavWeb extends StatelessWidget {
  const NavWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * .17,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pink.shade900,
                Colors.blue.withOpacity(0.8),
              ], // Adjust colors as needed
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(
                flex: 1,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          MediaQueryUI.isMobile(context)
                              ? Container()
                              :
                          showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 300,
                                      decoration: BoxDecoration(
                                        gradient: WidgetsStyles.buttonhomestyle,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Center(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              DispalyProfile(),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('اغلاق'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                        },
                        child: CircleAvatar(
                          child: Image.asset(
                            "assets/images/patient.png",
                            width: MediaQuery.of(context).size.height * .09,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: (){
                            TextEditingController name = TextEditingController();
                            TextEditingController age = TextEditingController();
                            TextEditingController pnumber = TextEditingController();
                            TextEditingController adress = TextEditingController();
                            var keyform1 =GlobalKey<FormState>();
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return  Container(
                                  height: 300,
                                  child: Form(
                                    key: keyform1,
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
                                          CustomButton(
                                              back_color: Colors.pink.shade900,
                                              text: "Submit",
                                              ontap: () {
                                                if(keyform1.currentState!.validate()){
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
                                              width: 300)

                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                            child: Text("تعديل الملف الشخصي",style: TextStyle(color: Colors.white),)),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(20, 20), // Width: 200, Height: 50
                          ),
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Routting.pushreplaced(context, Login());
                          },
                          child: Text("تسجيل الخروج")),
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 20,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "عيادة اونلاين",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                            // color:Colors.cyan,
                            onPressed: () {
                              Routting.push(context, StatusBook());
                            },
                            child: Row(
                              children: [
                                Text("حاله الحجز",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                Image.asset(
                                  "webimages/booking.png",
                                  width: 30,
                                ),
                              ],
                            )),
                        MaterialButton(
                            // color:Colors.cyan,
                            onPressed: () {
                              Routting.push(context, ChatScreen());
                            },
                            child: Row(
                              children: [
                                Text("استشاره",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                Image.asset(
                                  "webimages/asking.png",
                                  width: 30,
                                ),
                              ],
                            )),
                        MaterialButton(
                            // color:Colors.cyan,
                            onPressed: () {
                              Routting.push(context,
                                  History()); // Ensure to add a valid route here
                            },
                            child: Row(
                              children: [
                                Text("التاريخ المرضي",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                Image.asset(
                                  "webimages/medical-folder.png",
                                  width: 30,
                                ),
                              ],
                            )),
                        MaterialButton(
                            // color:Colors.cyan,
                            onPressed: () {
                              Routting.push(context, Book_Painent());
                            },
                            child: Row(
                              children: [
                                Text("حجز",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                Image.asset(
                                  "webimages/clipboard.png",
                                  width: 30,
                                ),
                              ],
                            )),
                        // MaterialButton(
                        //     // color:Colors.cyan,
                        //     onPressed: () {
                        //       Routting.push(context, HomeWebScreen());
                        //     },
                        //     child: Text("الرئيسية",
                        //         style: TextStyle(
                        //             color: Colors.white, fontSize: 15))),
                      ],
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Image.asset(
                "assets/images/medical-team.png",
                width: MediaQuery.of(context).size.height * .05,
              ),
              Spacer(
                flex: 1,
              ),
            ],
          )),
    );
  }
}

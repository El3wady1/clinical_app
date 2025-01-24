import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/mediaquery.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/Doctor/home/view/widget/button_home.dart';
import 'package:appnote/feature/book&edite/view/booknow.dart';
import 'package:appnote/feature/chat/view/chats.dart';
import 'package:appnote/feature/drawer/view/drawer.dart';
import 'package:appnote/feature/home/repo/streambuilder_getoffers.dart';
import 'package:appnote/feature/advises/view/advises.dart';
import 'package:appnote/feature/home/view/healthnews.dart';
import 'package:appnote/feature/history/view/history.dart';
import 'package:appnote/feature/home/view/webhome.dart';
import 'package:appnote/feature/statusbook/view/statusbook.dart';
import 'package:appnote/feature/login/view/LogInScreen.dart';
import 'package:appnote/feature/profile/view/profile.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  String? name;
  String? email;


  
  Homepage({required this.name, required this.email});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context)=>MediaQuery.of(context).size.width>=418;
    bool isMobile(BuildContext context)=>MediaQuery.of(context).size.width<418;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawr.createDrawer(context),
      backgroundColor: Colors.blue.withOpacity(0.3),
      appBar: MediaQueryUI.isMobile(context)?AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.location_history_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
        flexibleSpace: WidgetsStyles.AppbarStylee,
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text("عيادة اونلاين",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 23)),
        backgroundColor: Colors.pink.shade900,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Routting.pushreplaced(context, Login());
            },
            icon: Icon(
              Icons.exit_to_app_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ):null,
      body: MediaQueryUI.isMobile(context)?SingleChildScrollView( // Wrap the Column in SingleChildScrollView
        child: Container(
          decoration: BoxDecoration(gradient: WidgetsStyles.buttonhomestyle),
          child:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ": الخيـارات ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10), // Added spacing between text and icon
                    Image.asset(
                      "assets/icons/badge.png",
                      width: 35,
                    ),
                  ],
                ),
              ),
              Container(

                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DHomeButton(
                      image: "assets/images/add-user.png",
                      text: 'حجز الان',
                      tap: () {
                        Routting.push(context, Book_Painent());
                      },
                    ),
                    DHomeButton(
                      image: "assets/images/writing.png",
                      text: 'التاريخ المرضي',
                      tap: () {
                        Routting.push(context, History());
                      },
                    ),
                    DHomeButton(
                      image: "assets/images/health-check.png",
                      text: "استشاره ",
                      tap: () {
                        Routting.push(context, ChatScreen()); // Ensure to add a valid route here
                      },
                    ),
                    DHomeButton(
                      image: "assets/images/project.png",
                      text: 'حاله الحجز',
                      tap: () {
                        Routting.push(context, StatusBook());
                      },
                    ),
                    DHomeButton(
                      image: "assets/images/news-report.png",
                      text: 'اخبار عن صحه',
                      tap: () {
                        AwesomeDialog(
                          btnOkIcon: Icons.dangerous,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            Routting.push(context, NewsHealth(lang: true));
                          },
                          btnCancelIcon: Icons.close,
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.rightSlide,
                          headerAnimationLoop: false,
                          title: '',
                          desc: 'اختار نوع الأخبار ؟',
                          descTextStyle: TextStyle(fontSize: 35),
                          btnCancel: InkWell(
                            onTap: () {
                              Routting.push(context, NewsHealth(lang: false));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "انجليزي",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          btnOk: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () =>
                                  Routting.push(context, NewsHealth(lang: true)),
                              child: Text(
                                "عربي",
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          btnOkColor: Colors.red,
                        ).show();
                      },
                    ),
                    DHomeButton(
                      image: "assets/images/smartphone.png",
                      text: 'نصائح',
                      tap: () {
                        Routting.push(context, Advises());
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        " :  العــروض و الأحدث",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Added spacing between text and icon
                    Image.asset(
                      "assets/icons/job-offer.png",
                      width: 35,
                    ),
                  ],
                ),
              ),
              Lottie.asset(
                "assets/animations/BED.json",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              DispalyOffers(),
            ],
          ),
        ),
      ):HomeWebScreen(),
    );
  }
}

import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/mediaquery.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/bottomnavbar/widget/homebody_view.dart';
import 'package:appnote/feature/controller/cubite_homeview_cubit.dart';
import 'package:appnote/feature/home/view/home.dart';
import 'package:appnote/feature/home/view/widget/navbarweb.dart';
import 'package:appnote/feature/statusbook/services/displaystatusbook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQueryUI.isMobile(context)
          ? AppBar(
              flexibleSpace: WidgetsStyles.AppbarStylee,
              automaticallyImplyLeading: true,
              centerTitle: true,
              title: Text(
                "حاله الحجز",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.white),
              ),
            )
          : null,
      body: BlocProvider(
        create: (context) => HomeviewCubite(),
        child: Container(
          decoration: BoxDecoration(gradient: WidgetsStyles.buttonhomestyle),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MediaQueryUI.isMobile(context)
                          ? CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 120,
                              child: Image.asset("assets/images/patient.png"),
                            )
                          : Container(),
                      MediaQueryUI.isMobile(context)
                          ? Container()
                          : Container(
                              height: MediaQuery.of(context).size.height * .2,
                            ),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(children: [
                          DispalyStatusBook(),
                          MaterialButton(
                              onPressed: () {
                                Routting.popNoRoute(context);
                              },
                              child: Icon(
                                Icons.mark_chat_read,
                                size: 35,
                                color: Colors.yellow.shade900,
                              ))
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              MediaQueryUI.isMobile(context) ? Container() : NavWeb(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

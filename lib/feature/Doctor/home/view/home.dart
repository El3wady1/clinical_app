import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/Doctor/Set%20appointment/views/setappoint.dart';
import 'package:appnote/feature/Doctor/appoientments/views/appoients.dart';
import 'package:appnote/feature/Doctor/consaltant/view/chatdoc.dart';
import 'package:appnote/feature/Doctor/consaltant/view/widgets/pat_consalt.dart';
import 'package:appnote/feature/Doctor/hascheck/view/hascheck.dart';
import 'package:appnote/feature/Doctor/offers/view/offers.dart';
import 'package:appnote/feature/Doctor/home/view/widget/button_home.dart';
import 'package:appnote/feature/Doctor/paients/view/paientviews.dart';
import 'package:appnote/feature/Doctor/set_histo/view/sethisto.dart';
import 'package:appnote/feature/Doctor/setclincLocation/presentation/view/setclinlcLocation.dart';
import 'package:appnote/feature/login/view/LogInScreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class D_Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        automaticallyImplyLeading: false,
        toolbarHeight: 115,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: Image.asset("assets/images/stethoscope1.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(
                  "لوحه التحكم",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "للدكتور فقط",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ]),
            )
          ],
        ),
        backgroundColor: Colors.deepPurple.shade900,
        actions: [
          MaterialButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Routting.pushreplaced(context, Login());
              },
              child: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            gradient: WidgetsStyles.buttonhomestyle,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DHomeButton(
                    image: "assets/images/data.png",
                    text: "التاريخ المرضي",
                    tap: () => Routting.push(context, SetHisto()),
                  ),
                  DHomeButton(
                    image: "assets/images/discount.png",
                    text: 'عروض',
                    tap: () => Routting.push(context, Offers()),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DHomeButton(
                    image: "assets/images/patient.png",
                    text: 'المرضي',
                    tap: () => Routting.push(context, PaientsViews()),
                  ),
                  DHomeButton(
                    image: "assets/images/writing.png",
                    text: 'تم الكشف',
                    tap: () => Routting.push(context, Hascheck()),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DHomeButton(
                    image: "assets/images/work-in-progress.png",
                    text: ' الحجوزات ',
                    tap: () => Routting.push(context, Appoinents()),
                  ),
                  DHomeButton(
                    image: "assets/images/b.png",
                    text: 'موعد للمريض',
                    tap: () => Routting.push(context, SetAppoinent()),
                  )
                ],
              ),
              DHomeButton(
                image: "assets/icons/pin.png",
                text: "وضع مكان للعياده",
                tap: () => Routting.push(context, Setclinc_Location()),
              ),   DHomeButton(
                image: "assets/images/consultation.png",
                text: "رد علي استشاره",
                tap: () => Routting.push(context, PaientsViewsConsalt()),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}

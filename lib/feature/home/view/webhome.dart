import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/about/view/about.dart';
import 'package:appnote/feature/home/repo/streambuilder_getoffers.dart';
import 'package:appnote/feature/home/view/widget/navbarweb.dart';
import 'package:flutter/material.dart';

import '../../profile/services/displayprofile.dart';

class HomeWebScreen extends StatelessWidget {
  const HomeWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: WidgetsStyles.buttonhomestyle),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .17,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.pink.shade900,
                          Colors.blue.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                  //////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .9,
                                child: Image.asset(
                                  "webimages/drugs.png",
                                  width: MediaQuery.of(context).size.width * .5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 60),
                            Container(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "تطبيق العيادة الطبية يوفر منصة متكاملة لحجز المواعيد الطبية وإدارة الملفات الصحية للمرضى. يسهل التواصل بين الطبيب والمرضى مع إمكانية الوصول إلى الاستشارات والتقارير الطبية بسهولة",
                                  style: TextStyle(fontSize: 20, color: Colors.black),
                                ),
                              ),
                              height: 200,
                            ),
                            DispalyOffers(),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            NavWeb(),
            Positioned(
                bottom: 0,
           left: 0,
                child: InkWell(
                onTap: (){
                  Routting.push(context, About());

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(child:Image.asset("assets/images/support.png")),
                ))
            )],
        ),
      ),
    );
  }
}

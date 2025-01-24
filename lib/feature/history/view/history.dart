import 'package:appnote/core/utils/mediaquery.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/history/view/services/displayhistory.dart';
import 'package:appnote/feature/home/view/widget/navbarweb.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQueryUI.isMobile(context)
          ? AppBar(
              flexibleSpace: WidgetsStyles.AppbarStylee,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.pink.shade700,
              centerTitle: true,
              title: Text(
                "التاريخ المرضي",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: Colors.white),
              ),
            )
          : null,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: WidgetsStyles.buttonhomestyle),
            child: ListView(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Container(
                        height: MediaQuery.of(context).size.height*0.1,
                      ),
                      MediaQueryUI.isMobile(context)
                          ? Lottie.asset("assets/animations/f.json")
                          : Container(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ":  انت  مريض بــ   ",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ),
                      DispalyHistory(),
                    ],
                  ),
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35)),
                ),
              ],
            ),
          ),
          MediaQueryUI.isMobile(context) ? Container() : NavWeb(),
        ],
      ),
    );
  }
}

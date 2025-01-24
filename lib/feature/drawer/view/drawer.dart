import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/about/view/about.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Drawr {
  static Drawer createDrawer(BuildContext context) {
    var emailname = FirebaseAuth.instance.currentUser?.email;

    return Drawer(
      elevation: 0,
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(gradient: WidgetsStyles.drawr),
              accountName: Text(
                "${emailname?.replaceFirst(RegExp(r'@.*'), '').toUpperCase()}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              accountEmail: Text(
                "${emailname}",
                style: TextStyle(fontSize: 17),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 120,
                      child: Image.asset("assets/images/patient.png"),
                    ),
                  ),
                ),
              ),
            ),
            // ListTile(
            //   leading: Icon(Icons.home),
            //   title: Text('Home'),
            //   onTap: () {
            //     // Add your navigation logic here
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: Image.asset("assets/images/support.png",height: 40,),
              title: Text("عن التطبيق",style: TextStyle(fontSize: 22),),
              onTap: () {
                Routting.push(context, About());
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading:Image.asset("assets/images/left-arrow.png",height: 35,),
              title: Text('رجوع ',style: TextStyle(fontSize: 20),),
              onTap: () {
                Navigator.pop(context);

                // Add your logout logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}

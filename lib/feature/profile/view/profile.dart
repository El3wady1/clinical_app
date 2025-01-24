import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/profile/services/displayprofile.dart';
import 'package:appnote/feature/profile/services/updateprofileservices.dart';
import 'package:appnote/feature/profile/view/editeprofile.dart';
import 'package:appnote/feature/profile/view/widget/button_editprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  var currentuser = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        title: Text(
          "معلوماتي",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          gradient: WidgetsStyles.buttonhomestyle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 11), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0),
                        radius: MediaQuery.of(context).size.width * 0.15,
                        child: Image.asset("assets/icons/patient (1).png"),
                      ),
                      Positioned(
                        right: 5,
                        left: 5,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.red.shade800,
                          child: IconButton(
                            color: Colors.grey,
                            icon: Icon(Icons.edit, color: Colors.white),
                            onPressed: () => Routting.push(
                              context,
                              Editeprofile(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                DispalyProfile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

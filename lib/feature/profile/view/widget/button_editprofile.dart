import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/feature/profile/services/updateprofileservices.dart';
import 'package:appnote/feature/profile/view/editeprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ButtonEditeprofile extends StatelessWidget {
var ontap;
  @override
  ButtonEditeprofile({required this.ontap});

Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              height: MediaQuery.of(context).size.height*0.07,

          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 11), // changes position of shadow
                ),
              ],

              borderRadius: BorderRadius.circular(25),
              color: Colors.grey),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Edit profile", style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.edit, size: 35, color: Colors.white,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}

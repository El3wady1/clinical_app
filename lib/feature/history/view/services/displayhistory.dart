import 'package:appnote/feature/history/view/model/model_history.dart';
import 'package:appnote/feature/home/models/offermodel.dart';
import 'package:appnote/feature/home/view/offerbox.dart';
import 'package:appnote/feature/statusbook/view/statusbook.dart';
import 'package:appnote/feature/profile/model/modelprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DispalyHistory extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
  var userc =FirebaseAuth.instance.currentUser!.uid;
    var offerref =
    FirebaseFirestore.instance.collection("users").doc(userc);

    return StreamBuilder(
        stream: offerref.snapshots(),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            Duration(milliseconds: 1500);
            Object? p = snapshots.data;
            var histo =ModelHistory.fromJson(p);
            return   Container(
              height: 300,
              child: ListView( children: [
                OffersBox(offertext: " ${histo.history??"بانتظار التحديث ....."}"),


              ],),
            );
          } else if (snapshots.hasError) {
            return Text("هناك مشكله سوف يتم حلها قريبا");
          }
          else if (snapshots.hasError) {
            return Text("هناك مشكله سوف يتم حلها قريبا");
          } else if (!snapshots.hasData || !snapshots.data!.exists) {
            return Text("لايوجد شبكه او هناك عطل انتظر ..");
          }else {

            return  Center(child: CircularProgressIndicator());
          }

        });
  }
}



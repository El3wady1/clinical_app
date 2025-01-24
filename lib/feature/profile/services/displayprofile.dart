import 'package:appnote/feature/home/models/offermodel.dart';
import 'package:appnote/feature/home/view/offerbox.dart';
import 'package:appnote/feature/home/view/widget/namedprofile.dart';
import 'package:appnote/feature/profile/model/modelprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DispalyProfile extends StatelessWidget {
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
            var profilr_model =Modelprofile.fromJson(p);
            return   Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: Column( children: [
NamedProfile(offertext: " : الأسم ",),
                OffersBox(offertext: "${profilr_model.name}"),
                NamedProfile(offertext: " : الأميل ",),

                OffersBox(offertext: " ${profilr_model.email}"),
                                NamedProfile(offertext: " : السن ",),

                OffersBox(offertext: " ${profilr_model.age}"),
                                                NamedProfile(offertext: " : العنوان ",),

                OffersBox(offertext: "${profilr_model.adress}"),
                                                                NamedProfile(offertext: " : الهاتف ",),

                OffersBox(offertext: " ${profilr_model.phone}"),

              ],),
            );
          }  else if (snapshots.hasError) {
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



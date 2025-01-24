import 'package:appnote/feature/home/models/offermodel.dart';
import 'package:appnote/feature/home/view/offerbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DispalyOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference offerref =
    FirebaseFirestore.instance.collection("offersid");

    return StreamBuilder(
        stream: offerref.snapshots(),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            Duration(milliseconds: 1500);
          Object? x = snapshots.data!.docs[0].data();
          var m_model =Offermodel.fromJson(x);
         return   OffersBox(offertext: "${m_model.offernow}");
          } else if (snapshots.hasError) {
            return Text("There is error !${snapshots.error}");
          } else {

            return  Center(child: CircularProgressIndicator());
          }

        });
  }
}



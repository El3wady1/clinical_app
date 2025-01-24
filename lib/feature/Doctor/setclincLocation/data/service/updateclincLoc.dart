import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/widgets/showsnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void UpdateClincLoc({
  required double lat,
  required double lang,
 required BuildContext context,

}) async {
  // Get a reference to the document
  DocumentReference documentReference = FirebaseFirestore.instance
      .collection('clincLoc')
      .doc("loc");

  // Update the fields you want to change
  documentReference.set({
    'lat': lat,
    'lang': lang,
    // Add more fields as needed
  }).then((_) {
    showTrueSnackBar(context: context, message: "تم وضع العنوان بنجاح", icon: Icons.satellite_alt_sharp);
    print('Document updated successfully.');
  }).catchError((error) {
    showfalseSnackBar(context: context, message: "فشل وضع العنوان", icon: Icons.satellite_alt_sharp);

    print('Error updating document: $error');
  });
}
import 'package:appnote/core/widgets/showsnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void SendConsaltantDR({
  required String const_p
  ,required BuildContext context,
  required String ui
}) async {
  // Get a reference to the document
  DocumentReference documentReference = FirebaseFirestore.instance
      .collection('massage')
      .doc("${ui}");

  // Update the fields you want to change
  documentReference.update({
    'dr': '$const_p',
    "status":"p"
    // Add more fields as needed
  }).then((_) {
    print('Document updated successfully.');
    showTrueSnackBar(context: context, message: "تم الارسال رد للمريض", icon: Icons.send);
  }).catchError((error) {
    showfalseSnackBar(context: context, message: "فشل الارسال", icon: Icons.refresh_outlined);

    print('Error updating document: $error');
  });
}
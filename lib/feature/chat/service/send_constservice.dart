import 'package:appnote/core/widgets/showsnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 SendConsaltant({
  required String const_p
  ,required BuildContext context
}) async {
  // Get a reference to the document
  DocumentReference documentReference = FirebaseFirestore.instance
      .collection('massage')
      .doc("${FirebaseAuth.instance.currentUser!.uid}");

  // Update the fields you want to change
  documentReference.update({
    'p': '$const_p',
    'dr':"انتظر الرد",
    "status":"dr"
    // Add more fields as needed
  }).then((_) {
    print('Document updated successfully.');
    showTrueSnackBar(context: context, message: "تم الارسال للدكتور انتظر الرد", icon: Icons.send);
  }).catchError((error) {
    showfalseSnackBar(context: context, message: "فشل الارسال", icon: Icons.refresh_outlined);

    print('Error updating document: $error');
  });
}
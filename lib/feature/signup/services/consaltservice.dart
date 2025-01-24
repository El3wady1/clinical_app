import 'package:appnote/core/widgets/showsnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void MakeConsalt({
  required BuildContext context,
  required var uid
}) async {
  // Get a reference to the document
  DocumentReference documentReference = FirebaseFirestore.instance
      .collection('massage')
      .doc("${uid}");

  // Update the fields you want to change
  documentReference.set({
    'dr': 'انتظر الرد',
    'p':"ارسال استشاره",
    "status":"p"
    // Add more fields as needed
  }).then((_) {
    print('Document updated successfully.');
  }).catchError((error) {
    showfalseSnackBar(context: context, message: "فشل الارسال", icon: Icons.refresh_outlined);

    print('Error updating document: $error');
  });
}
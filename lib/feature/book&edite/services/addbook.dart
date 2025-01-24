import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void AddStudentBook({
  required String userid,
  @required var problem,
  @required var book
}) async {
  // Get a reference to the collection
  var collectionReference =
      FirebaseFirestore.instance.collection('users').doc(userid);

  // Add a document with a generated ID
  await collectionReference.update(

      {

    "userid":userid,
    "problem":problem,
    "book":book,
        "statusbook" :"جاري تحديد موعد ....",
        "date" :"جاري التحديث",
        "time" :"جاري التحديث",
    // Add more fields as needed
  }).then((_) {
    print('Document added successfully.');
  }).catchError((error) {
    print('Error adding document: $error');
  });
}

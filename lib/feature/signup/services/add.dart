import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void AddData({
  required String userid,
  required String name,
  required var email,
  required var age,
  required var phone,
  @required var gander,
  @required var adress,
  @required var date,
  @required var time,
  @required var history,
  @required var pass
}) async {
  // Get a reference to the collection
  var collectionReference =
      FirebaseFirestore.instance.collection('users').doc(userid);

  // Add a document with a generated ID
  await collectionReference.set({
    'name': name,
    'age': age,
    'email': email,
    'pass': pass,
    'gander': gander,
    "phone": phone,
    "adress": adress,
    "statusbook" :"جاري تحديد موعد ....",
    "date" :"جاري التحديث",
    "time" :"جاري التحديث",
    "userid":userid,
    "problem":"بانتظار التحديث .....",
    "book":"بانتظار التحديث .....",
    "history":"بانتظار التحديث .....",
// Add more fields as needed
  }).then((_) {

    print('Document added successfully.');
  }).catchError((error) {
    print('Error adding document: $error');
  });
}

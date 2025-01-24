import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void UpdateProfieData({
  required String userid,
  required String name,
  required var age,
  required var phone,
  @required var adress,
}) async {
  // Get a reference to the collection
  var collectionReference =
  FirebaseFirestore.instance.collection('users').doc(userid);

  // Add a document with a generated ID
  await collectionReference.update({
    'name': name,
    'age': age,
    "phone": phone,
    "adress": adress,
    "userid":userid,

// Add more fields as needed
  }).then((_) {
    print('Document added successfully.');
  }).catchError((error) {
    print('Error adding document: $error');
  });
}

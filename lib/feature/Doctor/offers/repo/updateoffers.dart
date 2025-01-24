import 'package:appnote/core/utils/app_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void updateDataOffers({
  required var con_offer
}) async {
  // Get a reference to the document
  DocumentReference documentReference = FirebaseFirestore.instance
      .collection('offersid')
      .doc("B8PsNmAkOYg2ckYMWnuw");

  // Update the fields you want to change
  documentReference.update({
    'offernows': '$con_offer',
    // Add more fields as needed
  }).then((_) {
    print('Document updated successfully.');
  }).catchError((error) {
    print('Error updating document: $error');
  });
}
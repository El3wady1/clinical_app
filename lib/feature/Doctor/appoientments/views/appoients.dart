import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/home/repo/getnewsrepo.dart';
import 'package:appnote/feature/home/services/luanchurlnews.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Appoinents extends StatelessWidget {
  Future<void> UpdateCheck({required String doc_id}) async {
    // Implement your logic to update item in Firestore
    // For demonstration purposes, let's just update a dummy field
    await FirebaseFirestore.instance.collection('users').doc(doc_id).update({
      'statusbook': 'تم الكشف',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        centerTitle: true,
        title: Text(
          "موعد وتاريخ الحجز لكل مريض  ",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where("statusbook", isEqualTo: 'تم اخذ موعد ')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'لا يوجد حجوزات',
                style: TextStyle(fontSize: 35,),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var document = snapshot.data!.docs[index];
              return ListTile(
                trailing: Text("${document['time']}"),
                title: Text(document['name']),
                subtitle: Text(" ${document['date']} "),
                leading: FloatingActionButton(
                  focusElevation: 10,
                  elevation: 11,
                  splashColor: Colors.white,
                  backgroundColor: Colors.red.shade900,
                  child: Text(
                    "تم الكشف",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    UpdateCheck(doc_id: document.id);

                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

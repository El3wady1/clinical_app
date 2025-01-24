import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Hascheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        backgroundColor: Colors.pink.shade700,
        centerTitle: true,
        title: Text(
          "تم الكشف",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where("statusbook", isEqualTo: 'تم الكشف')
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
                  'لا يوجد كشف',
                  style: TextStyle(fontSize: 35),
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var document = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(document['name']),
                  subtitle: Text(" ${document['statusbook']} "),
                  leading: CircleAvatar(
                      radius: 40,
                      child: Image.asset("assets/images/patient.png")),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

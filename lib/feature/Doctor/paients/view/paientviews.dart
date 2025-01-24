import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/home/repo/getnewsrepo.dart';
import 'package:appnote/feature/home/services/luanchurlnews.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PaientsViews extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
flexibleSpace: WidgetsStyles.AppbarStylee,
        centerTitle: true,
        title: Text(
          "المرضي",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
              child: Text('لا مرضي'),
            );
          }
          return ListView.builder(

            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var document = snapshot.data!.docs[index];
              return ListTile(

                trailing: Text(document['phone']) ,
                  title: Text(document['name']),
                  subtitle: Text(document['adress']),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,

                    child: Image.asset("assets/images/patient.png"),
                  ),

              );
            },
          );
        },
      ),
    );
  }
}


import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/Doctor/consaltant/view/chatdoc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaientsViewsConsalt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        centerTitle: true,
        title: Text(
          "المرضي",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: () {
                      // Retry logic here
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Check if the snapshot has data and if it's not empty
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('لا مرضي'));
          }

          // Use null-aware operators for safety
          var docs = snapshot.data!.docs;

          return ListView.separated(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var document = docs[index];

              // Use null checks for document fields
              String userId = document['userid'] ?? '';
              String name = document['name'] ?? 'Unnamed';
              String address = document['adress'] ?? 'No address';

              return ListTile(
                trailing: IconButton(
                  color: Colors.green,
                  onPressed: () {
                    if (userId.isNotEmpty) {
                      print(userId);
                      Routting.push(context, ChatScreenD( x: userId,));
                    } else {
                      // Handle the case where userId is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid user ID')),
                      );
                    }
                  },
                  icon: Text("رد"),
                ),
                title: Text(name),
                subtitle: Text(address),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Image.asset("assets/images/patient.png"),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey),
          );
        },
      ),
    );
  }
}

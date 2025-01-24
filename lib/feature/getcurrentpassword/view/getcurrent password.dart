import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PassFieldScreen extends StatefulWidget {
  @override
  _PassFieldScreenState createState() => _PassFieldScreenState();
}

class _PassFieldScreenState extends State<PassFieldScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? passField;

  Future<void> fetchPassField() async {
    String email = emailController.text;
    String phone = phoneController.text;

    try {
      // Query the 'users' collection
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .where('phone', isEqualTo: phone)
          .get();

      // Check if the query returns any documents
      if (snapshot.docs.isNotEmpty) {
        // Get the first document (assuming email and phone are unique)
        DocumentSnapshot userDoc = snapshot.docs.first;

        // Retrieve the 'pass' field
        setState(() {
          passField = userDoc['pass'];
        });
      } else {
        setState(() {
          passField = '.. غير متوفر راجع بياناتك.. ';
        });
      }
    } catch (e) {
      setState(() {
        passField = 'خطأ';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          "استرجاع الرقم السري",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 23),
        ),
        backgroundColor: Colors.pink.shade900,
        leading: IconButton(
          onPressed: () {
            Routting.popNoRoute(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'الايميل',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  fetchPassField();
                },
                child: Text('استرجاع'),
              ),
              SizedBox(height: 16),
              Text(
                 '.. الرقم السري ..',
                style: TextStyle(fontSize: 20),
              ),  Text(
                passField ?? 'ادخل اميلك و رقم تليفونك',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

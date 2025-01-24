import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/core/utils/mediaquery.dart';
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/bottomnavbar/widget/homebody_view.dart';
import 'package:appnote/feature/chat/model/chatmodel.dart';
import 'package:appnote/feature/chat/service/send_constservice.dart';
import 'package:appnote/feature/history/view/model/model_history.dart';
import 'package:appnote/feature/history/view/services/displayhistory.dart';
import 'package:appnote/feature/home/view/home.dart';
import 'package:appnote/feature/home/view/offerbox.dart';
import 'package:appnote/feature/home/view/widget/navbarweb.dart';
import 'package:appnote/feature/notificationservices.dart';
import 'package:appnote/feature/splash/views/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';  // Add this import for Timer

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  var userc = FirebaseAuth.instance.currentUser!.uid;
  var offerref =
  FirebaseFirestore.instance.collection("massage").doc("${FirebaseAuth.instance.currentUser!.uid}");
  var s;
  TextEditingController estraa = TextEditingController();
  Timer? _timer;  // Declare a Timer variable

  @override
  void initState() {
    super.initState();
    // Start the Timer
    _timer = Timer.periodic(Duration(seconds:5), (Timer timer) {
      setState(() {}); // Call setState to refresh the screen
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the Timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   MediaQueryUI.isMobile(context)? AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        automaticallyImplyLeading: true,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          "استشاره",
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
      ):null,
      body: Container(

        height: MediaQuery.of(context).size.height * 0.9,
        child: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                        height: MediaQuery.of(context).size.height*0.1,
                      ),
                          SizedBox(height: 30,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " ... ارسل استشارتك  ...",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 30,
                                  color: Colors.grey),
                            ),
                          ),
                          StreamBuilder<DocumentSnapshot>(
                            stream: offerref.snapshots(),
                            builder: (context, snapshots) {
                              if (snapshots.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else if (snapshots.hasError) {
                                return Text("Error: ${snapshots.error}");
                              } else if (!snapshots.hasData || !snapshots.data!.exists) {
                                return Text("لايوجد شبكه او هناك عطل انتظر ..");
                              } else {
                                var chatmode = Chatmodel.fromJson(snapshots.data!.data() as Map<String, dynamic>);
                                s = chatmode.status;
                                print(s);
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        ": ملحوظه",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        "يمكنك ارسال استشاره واحده لحين رد الدكتور فتاكد جيدا من استشاراتك قبل الارسال",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.right,
                                            ": المريض",
                                          ),
                                        ],
                                      ),
                                    ),
                                    LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Container(
                                          width: constraints.maxWidth,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              "${chatmode.p}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 17,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.deepPurple.shade900,
                                                Colors.blue,
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.right,
                                            ": الدكتور",
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          textAlign: TextAlign.right,
                                          "  ${chatmode.dr}  ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                      ),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
                  ),
                ),
              ),
            ),
            s == "p"
                ? Positioned(
              left: 10,
              right: 10,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: estraa,
                  decoration: InputDecoration(
                    hintText: " ... ادخل استشارتك ... ",
                    suffixIcon: IconButton(
                      onPressed: () {
                        SendConsaltant(const_p: estraa.text.toString(), context: context);
                        estraa.clear();
                        print(s);
                      },
                      icon: Icon(Icons.send),
                    ),
                  ),
                ),
              ),
            )
                : Positioned(
              left: 10,
              right: 10,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(" ... انتظر رد الدكتور ...")),
              ),
            ),

            MediaQueryUI.isMobile(context)?Container():NavWeb()
          ],
        ),
      ),
    );
  }
}

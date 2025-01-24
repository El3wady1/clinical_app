
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/feature/Doctor/consaltant/services/send_consaltant_d.dart';
import 'package:appnote/feature/chat/model/chatmodel.dart';
import 'package:appnote/feature/chat/service/send_constservice.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreenD extends StatelessWidget {
  final String x;
  late final DocumentReference offerref;

  ChatScreenD({required this.x}) {
    offerref = FirebaseFirestore.instance.collection("massage").doc(x);
  }

  final String userc = FirebaseAuth.instance.currentUser?.uid ?? '';
  String? s;
  final TextEditingController estraa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 70,
        title: const Text(
          "استشاره",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.pink.shade900,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          " ... ارسل استشارتك  ...",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      StreamBuilder<DocumentSnapshot>(
                        stream: offerref.snapshots(),
                        builder: (context, snapshots) {
                          if (snapshots.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshots.hasError) {
                            return Text("Error: ${snapshots.error}");
                          } else if (!snapshots.hasData || !snapshots.data!.exists) {
                            return const Text("غير متوفر الان");
                          } else {
                            var chatmode = Chatmodel.fromJson(snapshots.data!.data() as Map<String, dynamic>);
                            s = chatmode.status;

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    textAlign: TextAlign.right,
                                    ": ملحوظه",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
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
                                    children: const [
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
                                      padding: const EdgeInsets.all(8.0),
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
                                      child: Text(
                                        textAlign: TextAlign.right,
                                        "${chatmode.p}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        textAlign: TextAlign.right,
                                        ": الدكتور",
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    textAlign: TextAlign.right,
                                    "  ${chatmode.dr}  ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
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
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: estraa,
                  decoration: InputDecoration(
                    hintText: " ... ارسال استشارتك  للمريض ... ",
                    suffixIcon: IconButton(
                      onPressed: () {
                        SendConsaltantDR(
                          const_p: estraa.text.toString(),
                          context: context, ui: x,
                        );
                        estraa.clear();
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

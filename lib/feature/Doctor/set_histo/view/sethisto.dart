
import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:appnote/core/widgets/custom_button.dart';
import 'package:appnote/core/widgets/custom_textfeild.dart';
import 'package:appnote/core/widgets/showsnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SetHisto extends StatelessWidget {
  TextEditingController setadvictext = TextEditingController();

  var formkey=GlobalKey<FormState>();
  Future<void> UpdateItem({required String doc_id}) async {
    // Implement your logic to update item in Firestore
    // For demonstration purposes, let's just update a dummy field
    await FirebaseFirestore.instance.collection('users').doc(doc_id).update({
      'history': setadvictext.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.of(context).size.width;
    double higths = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: WidgetsStyles.AppbarStylee,
        centerTitle: true,
        title: Text(
          "وضع تاريخ مرضي",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: higths*0.3,
                child: ListView(children: [
                  Custom_Textfeild(
                    obscuretext: false,
                    controller: setadvictext,
                    labelStyle: TextStyle(),
                    validate: (r){
                      if(r.length<20){
                        return "ادخل التاريخ المرضي لا يقل عن 20 حرف";
                      }
                    },                 keyboardtype: TextInputType.text,
                    prefixIcon: Icon(Icons.av_timer),
                    suffixIcon: Icon(null),
                    hint: "ادخل التاريخ المرضي",
                    backgroundcolor: Colors.white,
                    bordercolor: Colors.black,
                    hintstyle: TextStyle(color: Colors.blue,fontSize: 20),
                    borderwidth: 4,
                    borderradius: 20,
                    maxlines: 6,
                  ),
                ],),
              ),
            )
            ,
            Container(
              height: higths * 0.4,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users').snapshots(),
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
                        'لا يوجد بيانات',
                        style: TextStyle(fontSize: 25),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var document = snapshot.data!.docs[index];
                      return ListTile(
                        trailing: ElevatedButton(
                          onPressed: () {

                            if(formkey.currentState!.validate()){
                              UpdateItem(doc_id: document.id);
                              showTrueSnackBar(context: context, message: "تم وضع تشخيص بنجاح ", icon:Icons.check_circle);

                            }

                          },
                          child: Text(
                            'ضع تشخيص',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}

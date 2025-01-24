import 'package:appnote/core/utils/app_router.dart';
import 'package:appnote/feature/signup/view/SignUpScreen.dart';

import 'package:flutter/material.dart';

class Registernow extends StatelessWidget {
  const Registernow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("ليس لدي اكونت !",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
      SizedBox(width: 10),
      GestureDetector(
        onTap: () =>Routting.pushreplaced(context,SignUp())
        ,
        child: Container(
          child: Text("انشاء حســـاب ؟",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white)),
        ),
      )
    ]);


  }
}

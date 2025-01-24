import 'package:appnote/feature/chat/view/chats.dart';
import 'package:appnote/feature/controller/cubite_homeview_cubit.dart';
import 'package:appnote/feature/splash/views/splash.dart';
import 'package:appnote/feature/Doctor/setclincLocation/presentation/view/setclinlcLocation.dart';
import 'package:appnote/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool? islogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(AppNote());
}

class AppNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "عياده اونلاين",
      // home:Splash(),
      debugShowCheckedModeBanner: false,
       home: BlocProvider(create: (BuildContext context) =>HomeviewCubite(),
        // child: Setclinc_Location()),
    child: Splash()),

    );
  }
}

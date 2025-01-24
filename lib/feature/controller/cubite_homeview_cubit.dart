import 'dart:io';

import 'package:appnote/feature/Doctor/home/view/home.dart';
import 'package:appnote/feature/home/view/home.dart';
import 'package:appnote/feature/navigation/presentation/view/googlemaphomeview.dart';
import 'package:appnote/feature/profile/view/profile.dart';
import 'package:appnote/feature/splash/views/splash.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'cubite_homeview_state.dart';

class HomeviewCubite extends Cubit<Home_viewState> {
  HomeviewCubite() : super(HomeView_InialState());

  // Future<void> pickImage(BuildContext context) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //     if (pickedFile != null) {
  //       addchildimage = File(pickedFile.path);
  //       emit(ChangephotoAddChildState());
  //       showTrueSnackBar(context: context, message: "Image Picked", icon: Icons.camera);
  //     } else {
  //       showfalseSnackBar(context: context, message: "Image Not Picked", icon: Icons.no_accounts_sharp);

  //       print('No image selected.');
  //     }

  // }

  File? addchildimage;

  int curretnt_IndexnavBar = 0;
  bool giveVerse = true;
  File ? imageedit;

  bool isloading = false;
  bool isvisableSignUP_Child = true;
  bool isvisableSignIn_Chlid = true;
  bool isvisable_AdminLogin = true;
  // IconData? iconisvisable;
  List<Widget> homescreens = [
    Homepage(name: 'Patiant Email: ', email: "${FirebaseAuth.instance.currentUser!.email}"??'loading ...',),
    clinc_Location(),
    Profile()
    // NotifyScreen()
// Notificationss()
    // MapScreen(),
    // notifications_view()
  ];
//  pickImageedit() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         imageedit = File(pickedFile.path);
// emit(ChangephotoAddChildedtieState());
//       } else {
//         print('No image selected.');
//       }

//   }

  changeNavIndex(int x) {
    curretnt_IndexnavBar = x;
    emit(ChangeBottomNavIbexState());
  }

  changemode(value) {
    giveVerse = value;
    if (giveVerse == true) {
      // mode = "Dark";
    } else {
      // mode = "Ligth";
    }
    print(value);

    emit(ChangeNotifyState());
  }

  // issecure() {
  //   isvisable != isvisable;
  // }

  // toggleVisiblityPasswordSignUP_CHILD() {
  //   return IconButton(
  //       onPressed: () {
  //         isvisableSignUP_Child =! isvisableSignUP_Child;
  //         print(isvisableSignUP_Child);
  //         emit(VisiablilitySignUP_CHILD_IconState());
  //       },
  //       icon: Icon(
  //         isvisableSignUP_Child ? AssetIcons.unvasibleIcon : AssetIcons.vasibleIcon,
  //         color: Colors.white,
  //       ));
  // }
  /////

  // toggleVisiblityPassword_SignIN_CHILD() {
  //   return IconButton(
  //       onPressed: () {
  //         isvisableSignIn_Chlid =! isvisableSignIn_Chlid;
  //         print(isvisableSignIn_Chlid);
  //         emit(VisiablilitySignIN_CHILD_IconState());
  //       },
  //       icon: Icon(
  //         isvisableSignIn_Chlid ? AssetIcons.unvasibleIcon : AssetIcons.vasibleIcon,
  //         color: Colors.white,
  //       ));
  // }

  Isloading() {
    isloading = true;
    emit(IsloadingState());
  }

  Notloading() {
    isloading = false;
    emit(NotloadingState());
  }


                  //////   ADMIN  ////

  // toggleVisiblityPasswordSignIN_ADMIN() {
  //   return IconButton(
  //       onPressed: () {
  //         isvisable_AdminLogin =! isvisable_AdminLogin;
  //         print(isvisable_AdminLogin);
  //         emit(VisiablilitySignIN_ADMIN_IconState());
  //       },
  //       icon: Icon(
  //         isvisable_AdminLogin ? AssetIcons.unvasibleIcon : AssetIcons.vasibleIcon,
  //         color: Colors.white,
  //       ));
  // }
///google map.....
//   Future<void> getMyCurrentLocation() async {
//     await LocationHelper.getCurrentLocation();
//
//     Controllers.position = await Geolocator.getLastKnownPosition().whenComplete(() {
//       emit(GetcurrentLocationState());
//     });
//     log(Controllers.position!.toJson().toString());
//   }

}

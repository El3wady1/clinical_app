import 'package:appnote/feature/controller/cubite_homeview_cubit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Curved_Bottom_navBar extends StatelessWidget {
  const Curved_Bottom_navBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubite = BlocProvider.of<HomeviewCubite>(context);
    var currentindexNav = cubite.curretnt_IndexnavBar;
    return CurvedNavigationBar(
      index: currentindexNav,
      height: 60.0,

      items: <Widget>[
        Image.asset("assets/images/d2.png",width: 45,height: 45,),
        Image.asset("assets/icons/pin.png",width: 45,height: 45,),
        Image.asset("assets/icons/settings (1).png",width: 45,height: 45,),

        // Image.asset("assets/images/notification.png",width: 45,height: 45,)
      ],

      // buttonBackgroundColor: Colors.orange,
      color: Colors.blue.shade800,
      backgroundColor: Colors.amber.shade600,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      onTap: (index) => cubite.changeNavIndex(index),
    );
  }
}

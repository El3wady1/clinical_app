import 'package:appnote/core/utils/mediaquery.dart';
import 'package:appnote/feature/bottomnavbar/curved_bottom_nav.dart';
import 'package:appnote/feature/controller/cubite_homeview_cubit.dart';
import 'package:appnote/feature/controller/cubite_homeview_state.dart';
import 'package:appnote/feature/drawer/view/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomnavSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubite = BlocProvider.of<HomeviewCubite>(context);
    var current= cubite.curretnt_IndexnavBar;
    return BlocConsumer<HomeviewCubite, Home_viewState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
drawer: Drawr.createDrawer(context),
            bottomNavigationBar:MediaQueryUI.isMobile(context)? Curved_Bottom_navBar():null,
            body: cubite.homescreens[cubite.curretnt_IndexnavBar],
          ),
        );
      },
    );
  }
}

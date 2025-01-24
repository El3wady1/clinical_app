import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:flutter/material.dart';

class DHomeButton extends StatelessWidget {
  String text;
  String image;
var tap;

DHomeButton({
  required this.image,
  required this.text,required this.tap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width*.44,
          height: MediaQuery.of(context).size.height*.44,
          decoration: BoxDecoration(
            color: Colors.blue,
            gradient:WidgetsStyles.buttonhomescolor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 0.2,
                  blurRadius: 6,
                  offset: Offset(0,8), // changes position of shadow
                ),
              ],


              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(image,
                  height:  MediaQuery.of(context).size.height*.2 ,
                  width: MediaQuery.sizeOf(context).width*0.2,),
              ),

              Text(
                textAlign:TextAlign.center,
                text, style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),),
            ],
          ),),
      ),
    )    ;
  }
}

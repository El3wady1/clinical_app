import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:flutter/material.dart';

class OffersBox extends StatelessWidget {
   OffersBox({required this.offertext});
var offertext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.center,
            "$offertext",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize:17 , color: Colors.white),
          ),
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient:WidgetsStyles.buttonhomescolor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 11), // changes position of shadow
              ),
            ],
            // color: Colors.pink.shade700,
            borderRadius: BorderRadius.circular(50)),
      ),
    )
    ;
  }
}

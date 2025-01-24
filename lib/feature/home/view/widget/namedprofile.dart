import 'package:appnote/core/utils/widgetsstyle.dart';
import 'package:flutter/material.dart';

class NamedProfile extends StatelessWidget {
   NamedProfile({required this.offertext});
var offertext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0,top: 6,bottom: 4),
      child: Container(
      
        child: Text(
          textAlign: TextAlign.right,
          "$offertext",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
        ),
        width: double.infinity,
        
            // color: Colors.pink.shade700,
      ),
    )
    ;
  }
}

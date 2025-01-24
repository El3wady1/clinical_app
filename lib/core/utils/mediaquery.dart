import 'package:flutter/cupertino.dart';

class  MediaQueryUI{
static isMobile(BuildContext context){
  var screenSize = MediaQuery.of(context).size;

  // Determine if the device is a mobile or a desktop based on the width
  bool isMobile = screenSize.width < 610;
return isMobile;
}

}
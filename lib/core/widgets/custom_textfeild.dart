import 'package:flutter/material.dart';

class Custom_Textfeild extends StatelessWidget {
  Widget suffixIcon;

  Widget prefixIcon;

  String hint;
  Color backgroundcolor;
  Color bordercolor;
  TextStyle hintstyle;
  double borderwidth;
  var validate;
  TextStyle labelStyle;
  TextInputType keyboardtype;
int maxlines;
  //
  var controller;

  bool obscuretext;

  Custom_Textfeild(
      {
        required this.maxlines,
        required this.obscuretext,
      required this.controller,
      required this.labelStyle,
      required this.validate,
      required this.keyboardtype,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.hint,
      required this.backgroundcolor,
      required this.bordercolor,
      required this.hintstyle,
      required this.borderwidth,
      required this.borderradius
     });

  double borderradius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(borderradius),
        ),
        child: TextFormField(
          maxLines: maxlines,
          // maxLines: maxline,
          controller: controller,
          obscureText: obscuretext,
          keyboardType: keyboardtype,
          textInputAction: TextInputAction.next,
          validator: validate,
          decoration: InputDecoration(
            filled: true,
            fillColor: backgroundcolor,
            suffix: suffixIcon,
            prefix: prefixIcon,
            labelStyle: labelStyle,
            hintStyle: hintstyle,
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderradius),
                borderSide: BorderSide(

                    width: borderwidth, color: bordercolor)),
          ),
        ),
      ),
    );
  }
}

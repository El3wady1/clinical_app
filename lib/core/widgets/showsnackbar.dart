import 'package:flutter/material.dart';

void showfalseSnackBar(
    {required BuildContext context,
      required String message,
      required IconData icon,
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      clipBehavior: Clip.antiAlias,
      backgroundColor:Colors.red.shade900,
      elevation: 0,
      content: Container(

        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$message",style: TextStyle(color: Colors.white,fontSize: 26),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Example usage:
// showCustomSnackBar(context, "Hello, this is a custom snackbar!", Icons.info, Colors.blue);


void showTrueSnackBar(
    {required BuildContext context,
      required String message,
      required IconData icon,
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      clipBehavior: Clip.antiAlias,
      backgroundColor:Colors.green.shade900,
      elevation: 0,
      content: Container(

        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$message",style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Example usage:
// showCustomSnackBar(context, "Hello, this is a custom snackbar!", Icons.info, Colors.blue);

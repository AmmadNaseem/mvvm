import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(10),
        reverseAnimationCurve: Curves.easeOut,
        flushbarPosition: FlushbarPosition.TOP,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
        titleColor: Colors.white,
        backgroundColor: Colors.red,
        messageColor: Colors.white,
        message: message,
        duration: const Duration(seconds: 10),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static double averageRating(List<int> ratings) {
    var avgRating = 0;

    for (int i = 0; i < ratings.length; i++) {
      avgRating = avgRating + ratings[i];
    }
    return double.parse((avgRating / ratings.length).toStringAsFixed(1));
  }
}

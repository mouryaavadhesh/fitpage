import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ReusableWidget {

  static toastInternet() {
    Fluttertoast.showToast(
        msg: 'Please check internet connection.',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: Colors.blue,
        fontSize: 16.0);
  }

  static Future<bool?> toastMsg(String? msg, {ToastGravity? gravity}) {
    if (msg == null || msg.isEmpty) {
      return Future.value(false);
    }
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16.0,
        gravity: gravity);
  }

  static toastError(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: Colors.red,
        fontSize: 16.0);
  }


  static BoxDecoration boxDecoration(
      {List<Color> colors = const [Color(0xff56ab2f), Color(0xffa8e063)]}) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.transparent, width: 2),
      gradient: LinearGradient(
        begin: const Alignment(-1.0, 0.0),
        end: const Alignment(1.0, 0.0),
        colors: colors,
        stops: const [0.0, 1.0],
      ),
      boxShadow: const [
        BoxShadow(
          color: Color(0x29000000),
          blurRadius: 6,
        ),
      ],
    );
  }
}

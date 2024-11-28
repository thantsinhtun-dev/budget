import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension DateExt on String {
  String getTransitionDate() {
    var date = DateTime.parse(this);
    var dateFormat = DateFormat("d MMM, yyyy");
    return dateFormat.format(date);
  }

  String getCashFlowDate() {
    var date = DateTime.parse(this);
    var dateFormat = DateFormat("EEE, d MMM");
    return dateFormat.format(date);
  }
}

extension DateTimeExt on BuildContext {
  String getMorningText() {
    var hours = DateTime.now().hour;
    if (hours >= 1 && hours < 12) {
      return "Good Morning !";
    } else if (hours >= 12 && hours < 16) {
      return "Good Afternoon !";
    } else if (hours >= 16 && hours < 21) {
      return "Good Evening !";
    } else if (hours >= 21 && hours <= 24) {
      return "Good Night !";
    }else{
      return "";
    }
  }
  String getCurrentDate() {
    var date = DateTime.now();
    var dateFormat = DateFormat("EEE, d MMM");
    return dateFormat.format(date);
  }
}

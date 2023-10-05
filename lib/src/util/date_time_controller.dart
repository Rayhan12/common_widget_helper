
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeController extends ChangeNotifier{
  DateTime? dateTime;

  void inputDateTime(DateTime data){
    dateTime = data;
    notifyListeners();
  }
  void clearDateTime(){
    dateTime = null;
    notifyListeners();
  }

  String getDate(){
    return DateFormat().add_y().format(dateTime!);
  }


  String getMonth(){
    return DateFormat().add_M().format(dateTime!);
  }
  String getYear(){
    return DateFormat().add_d().format(dateTime!);
  }

  bool hasDate(){
    return dateTime != null;
  }

  String getDateMonthYear(){
    return DateFormat().add_yMMMd().format(dateTime!);
  }

  String getTime(){
    return DateFormat().add_Hm().format(dateTime!);
  }

  @override
  String toString() {
    return 'DateTimeController{dateTime: $dateTime}';
  }
}

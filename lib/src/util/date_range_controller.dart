
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangeController extends ChangeNotifier{
  DateTimeRange? dateTimeRange;

  void inputDateTime(DateTimeRange data){
    dateTimeRange = data;
    notifyListeners();
  }
  void clearDateTime(){
    dateTimeRange = null;
    notifyListeners();
  }

  String getStartDate(){
    return DateFormat().add_yMMMd().format(dateTimeRange!.start);
  }

  String getEndDate(){
    return DateFormat().add_yMMMd().format(dateTimeRange!.end);
  }

  bool hasDate(){
    return !dateTimeRange.toString().contains("null") ;
  }


  @override
  String toString() {
    return 'DateRangeController{Start Date: ${dateTimeRange!.start} , End Date: ${dateTimeRange!.end}}';
  }
}

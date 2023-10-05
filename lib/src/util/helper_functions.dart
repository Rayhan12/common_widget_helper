import 'package:intl/intl.dart';

String numberConverterInternal ({required num number,required bool isEnglish}){
  return NumberFormat.decimalPattern(isEnglish? 'en' : 'bn').format(number);
}

  const daysBn ="days";
  const lastThirtyDaysBn =  'শেষ ৩০ দিন';
  const showingDataOfBn = "Showing data of";
  const String showingDataOf = 'Showing data of';
  const String days = 'days';
  const String lastThirtyDays = 'last 30 days';



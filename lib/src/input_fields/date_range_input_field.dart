
import 'package:flutter/material.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';
import '../util/date_range_controller.dart';
import '../util/helper_functions.dart';

class DateRangeInputField extends StatefulWidget {
  final Color? backgroundColor;
  final bool? showSuffixIcons;
  final EdgeInsets? padding;
  final double? widgetGap;
  final DateTime defaultStartDate;
  final DateTime defaultEndDate;
  final bool isEnglish;
  final DateTimeRange? dateTimeSelectionRange;
  final DateRangeController dateRangeController;
  const DateRangeInputField({super.key, this.backgroundColor, this.padding, required this.dateRangeController, required this.defaultStartDate, required this.defaultEndDate, this.showSuffixIcons, this.dateTimeSelectionRange, this.widgetGap, required this.isEnglish});

  @override
  State<DateRangeInputField> createState() => _DateRangeInputFieldState();
}

class _DateRangeInputFieldState extends State<DateRangeInputField> {

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  String dateGap = "last 30 days";
  Future<void> callDateRangePicker({required BuildContext currentContext}) async{
    await showDateRangePicker(
      context: currentContext,
      lastDate: widget.dateTimeSelectionRange != null?  widget.dateTimeSelectionRange!.end : DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+3),
      firstDate: widget.dateTimeSelectionRange != null? widget.dateTimeSelectionRange!.start : DateTime(DateTime.now().year,DateTime.now().month-3),
      currentDate: DateTime.now(),
      initialDateRange: widget.dateRangeController.dateTimeRange!,
    ).then((dateRange) {
      if(dateRange != null)
      {
        widget.dateRangeController.dateTimeRange = dateRange;
        startDateController.text = widget.dateRangeController.getStartDate();
        endDateController.text = widget.dateRangeController.getEndDate();
        getDateGap();
        setState(() {});
      }
      else
      {
        getDateGap();
      }
    });
  }

  void getDateGap(){
    dateGap =  "${widget.isEnglish? showingDataOf : showingDataOfBn} ${numberConverterInternal(isEnglish: widget.isEnglish ,number: ((widget.dateRangeController.dateTimeRange!.end.difference(widget.dateRangeController.dateTimeRange!.start).inSeconds)/(3600*24)).round())} ${widget.isEnglish? days:daysBn}";
  }


  @override
  void initState() {
    if(!widget.dateRangeController.hasDate()) {
      widget.dateRangeController.inputDateTime(DateTimeRange(start: widget.defaultStartDate, end:  widget.defaultEndDate));
      startDateController.text = widget.dateRangeController.getStartDate();
      endDateController.text = widget.dateRangeController.getEndDate();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          getDateGap();
        });
      });
    }
    else
      {
        startDateController.text = widget.dateRangeController.getStartDate();
        endDateController.text = widget.dateRangeController.getEndDate();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          setState(() {
            dateGap = widget.isEnglish? lastThirtyDays : lastThirtyDaysBn;
          });
        });
      }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor ?? ConfigColor.white,
      child: InkWell(
        onTap: (){
          callDateRangePicker(currentContext: context);
        },
        child: Padding(
          padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date Range" ,style: TextDesignConfig().bodyTitle),
                  Text(dateGap ,style: TextDesignConfig().bodyTextExtraSmall,),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ConfigColor.scaffoldColor,
                      ),
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(startDateController.text ,style: TextDesignConfig().bodyTextSmall,overflow: TextOverflow.ellipsis),
                          if(widget.showSuffixIcons ?? false)
                            const Icon(Icons.calendar_month_rounded ,color: ConfigColor.textLightBlack,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: widget.widgetGap?? 5,),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ConfigColor.scaffoldColor,
                      ),
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(endDateController.text ,style: TextDesignConfig().bodyTextSmall,overflow: TextOverflow.ellipsis),
                          if(widget.showSuffixIcons ?? false)
                            const Icon(Icons.calendar_month_rounded ,color: ConfigColor.textLightBlack,)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
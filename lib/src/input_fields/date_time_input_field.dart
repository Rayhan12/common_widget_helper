import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';
import '../util/date_time_controller.dart';



class DateTimeInputField extends StatefulWidget {
  final TextEditingController controller;
  final DateTimeController dateTimeController;
  final String hintText;
  final String? suffixText;
  final bool needValidation;
  final String errorMessage;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final String fieldTitle;
  final bool? needTitle;
  const DateTimeInputField({Key? key, required this.controller, required this.hintText, required this.needValidation, required this.errorMessage, this.textInputAction, required this.dateTimeController, this.backgroundColor, this.suffixText, required this.fieldTitle, this.needTitle}) : super(key: key);

  @override
  State<DateTimeInputField> createState() => _DateTimeInputFieldState();
}

class _DateTimeInputFieldState extends State<DateTimeInputField> {
  DateTime? pickedDate;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.needTitle ?? true)
          Text(widget.fieldTitle ,style: TextDesignConfig().bodyTitle),
        if(widget.needTitle ?? true)
        TextFormField(
          controller: widget.controller,
          style: TextDesignConfig().bodySubText,
          decoration: InputDecoration(
            errorStyle: TextDesignConfig().bodyTextExtraSmall.copyWith(fontSize: 11 ,color: ConfigColor.red),
            contentPadding: const EdgeInsets.symmetric( horizontal: 20,vertical: 20),
            hintText: widget.hintText,
            hintStyle: TextDesignConfig().bodySubText.copyWith(color: ConfigColor.textLightBlack),
            filled: true,
            fillColor: widget.backgroundColor ?? ConfigColor.white,
            suffixIcon: null,
            suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
            ),
          ),
          readOnly: true,
          onTap: () {

            DatePicker.showDatePicker(context,
                currentTime: DateTime.now(),
                onChanged: (date){
                  pickedDate = date;

                  if (pickedDate != null) {
                    widget.dateTimeController.inputDateTime(pickedDate!);
                    String formattedDate = widget.dateTimeController.getDateMonthYear();
                    setState(() {
                      widget.controller.text = formattedDate;
                    });
                  } else {
                    setState(() {
                      widget.controller.text = widget.errorMessage;
                    });
                  }
                },
                onConfirm: (date){
                  pickedDate = date;

                  if (pickedDate != null) {
                    widget.dateTimeController.inputDateTime(pickedDate!);
                    String formattedDate = widget.dateTimeController.getDateMonthYear();
                    setState(() {
                      widget.controller.text = formattedDate;
                    });
                  } else {
                    setState(() {
                      widget.controller.text = widget.errorMessage;
                    });
                  }
                }
            );
          },

          validator: (value) {
            if(!widget.needValidation) return null;
            if (value == null || value.isEmpty) {
              return widget.errorMessage;
            }
            return null;
          },

        ),
      ],
    );
  }
}
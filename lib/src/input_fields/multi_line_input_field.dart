
import 'package:flutter/material.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';
import '../util/validators.dart';



class MultiLineInputField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String hintText;
  final String? suffixText;
  final int numberOfLines;
  final Color? backgroundColor;
  final bool? viewOnly;
  final bool? needTitle;
  final FormFieldValidator<String>? validatorClass;
  const MultiLineInputField({Key? key, required this.controller, required this.hintText, this.suffixText, this.backgroundColor, this.viewOnly, required this.fieldTitle, this.validatorClass, this.needTitle, required this.numberOfLines}) : super(key: key);

  @override
  State<MultiLineInputField> createState() => _MultiLineInputFieldState();
}

class _MultiLineInputFieldState extends State<MultiLineInputField> {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.needTitle ?? true)
          Text(widget.fieldTitle ,style: TextDesignConfig().bodyTitle),
        if(widget.needTitle ?? true)
          const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          keyboardType:TextInputType.multiline,
          style: TextDesignConfig().bodyTextSmall,
          readOnly: widget.viewOnly ?? false,
          maxLines: widget.numberOfLines,
          decoration: InputDecoration(
            errorStyle: TextDesignConfig().bodyTextExtraSmall.copyWith(fontSize: 11 ,color: ConfigColor.red),
            contentPadding: const EdgeInsets.symmetric( horizontal: 20,vertical: 20),
            //label: FocusScope.of(context).focusedChild != null ? Text(widget.hintText) : null,
            hintText: widget.hintText,
            hintStyle: TextDesignConfig().bodyTextSmall.copyWith(color: ConfigColor.textLightBlack),
            filled: true,
            fillColor: widget.backgroundColor ?? ConfigColor.white,
            suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
            suffixIcon: null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
            ),
          ),
          textInputAction: TextInputAction.newline,
          onFieldSubmitted: (value){
            widget.controller.text = value;
          },
          onSaved: (value){
            widget.controller.text = value!;
          },
          validator: widget.validatorClass ?? ValidatorClass().noValidationRequired ,

        ),
      ],
    );
  }
}

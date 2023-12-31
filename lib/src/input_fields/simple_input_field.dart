
import 'package:flutter/material.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';
import '../util/validators.dart';



class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String hintText;
  final bool needValidation;
  final String errorMessage;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final String? suffixText;
  final IconData? suffixIcon;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final IconData? prefixIcon;
  final bool? viewOnly;
  final bool? needTitle;
  final FormFieldValidator<String>? validatorClass;
  const SimpleInputField({Key? key, required this.controller, required this.hintText, required this.needValidation, required this.errorMessage, this.textInputAction, this.inputType, this.suffixText, this.backgroundColor, this.viewOnly, required this.fieldTitle, this.validatorClass, this.needTitle, this.suffixIcon, this.padding, this.textAlign, this.borderRadius, this.prefixIcon}) : super(key: key);

  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {
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
          keyboardType: widget.inputType ?? TextInputType.text,
          style: TextDesignConfig().bodyTextSmall,
          readOnly: widget.viewOnly ?? false,
          textAlign: widget.textAlign ?? TextAlign.start,
          decoration: InputDecoration(
              errorStyle: TextDesignConfig().bodyTextExtraSmall.copyWith(fontSize: 11 ,color: ConfigColor.red),
              contentPadding: widget.padding?? const EdgeInsets.symmetric( horizontal: 20,vertical: 20),
              //label: FocusScope.of(context).focusedChild != null ? Text(widget.hintText) : null,
              hintText: widget.hintText,
              hintStyle: TextDesignConfig().bodyTextSmall.copyWith(color: ConfigColor.textLightBlack),
              filled: true,
              fillColor: widget.backgroundColor ?? ConfigColor.white,
              suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
              suffixIcon: widget.suffixIcon !=null? Icon(widget.suffixIcon ,color: ConfigColor.textLightBlack,): null,
              prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
              border: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                  borderSide: BorderSide.none)
              ),
              textInputAction: widget.textInputAction ?? TextInputAction.next,
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

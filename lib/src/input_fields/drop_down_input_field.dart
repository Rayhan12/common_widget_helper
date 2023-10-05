import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';


class DropDownInputField extends StatefulWidget {
  final TextEditingController controller;
  final BorderRadius? borderRadius;
  final String fieldTitle;
  final String hintText;
  final bool needValidation;
  final String errorMessage;
  final TextInputAction? textInputAction;
  final String? suffixText;
  final Color? backgroundColor;
  final bool? needTitle;
  final bool? setInitialValue;
  final List<String> items;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  ///Common Error factor
  /// 1=> If item list contains duplicate values

  const DropDownInputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.needValidation,
      required this.errorMessage,
      this.textInputAction,
      this.suffixText,
      this.backgroundColor,
      required this.fieldTitle,
      this.needTitle,
      required this.items,
      this.setInitialValue,
      this.textStyle,
      this.padding,
      this.borderRadius})
      : super(key: key);

  @override
  State<DropDownInputField> createState() => _DropDownInputFieldState();
}

class _DropDownInputFieldState extends State<DropDownInputField> {
  // List<DropdownMenuItem<String>> itemsForList = [];



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.needTitle ?? true)
          Text(widget.fieldTitle,
              style: widget.textStyle ?? TextDesignConfig().bodyTitle),
        if (widget.needTitle ?? true) const SizedBox(height: 5),
        DropdownButtonFormField2(
          items: widget.items.map((e) => DropdownMenuItem<String>(
              value: e.toString(),
              child: SizedBox(
                width: size.width*0.4,
                child: Text(
                  e,
                  softWrap: true,
                  style: widget.textStyle ?? TextDesignConfig().bodyTextSmall,
                ),
              )))
              .toList(),
          style: widget.textStyle ?? TextDesignConfig().bodyTextSmall,
          decoration: InputDecoration(
            errorStyle: TextDesignConfig()
                .bodyTextExtraSmall
                .copyWith(fontSize: 11, color: ConfigColor.red),
            contentPadding: widget.padding ??
                (widget.controller.text.isNotEmpty
                    ? const EdgeInsets.only(
                        right: 10, left: 5, bottom: 15, top: 15)
                    : const EdgeInsets.only(
                        right: 10, left: 20, bottom: 15, top: 15)),
            hintText: widget.hintText,
            hintStyle: widget.textStyle ??
                TextDesignConfig()
                    .bodyTextSmall
                    .copyWith(color: ConfigColor.textLightBlack),
            filled: true,
            fillColor: widget.backgroundColor ?? ConfigColor.white,
            suffixText:
                widget.suffixText != null ? widget.suffixText.toString() : "",
            suffixIcon: null,
            border: OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide.none),
          ),
          value: (widget.setInitialValue ?? false) && widget.items.isNotEmpty
              ? widget.items[0]
              : null,
          onChanged: (value) {
            widget.controller.text = value.toString();
          },
          onSaved: (value) {
            widget.controller.text = value!.toString();
          },
          validator: (value) {
            if (!widget.needValidation) return null;
            if (value == null || value.toString().isEmpty) {
              return widget.errorMessage;
            }
            return null;
          },
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ConfigColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                    blurRadius: 13,
                  )
                ]),
          ),
        ),
      ],
    );
  }
}

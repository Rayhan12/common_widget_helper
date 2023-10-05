

import 'package:flutter/material.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';



class RadioInputField extends StatefulWidget {

  ///Maximum input length is 3 items
  final List<String> items;
  final TextEditingController controller;
  const RadioInputField({Key? key, required this.items, required this.controller}) : super(key: key);

  @override
  State<RadioInputField> createState() => _RadioInputFieldState();
}

class _RadioInputFieldState extends State<RadioInputField> {

  void onClick(String titleName){
    setState(() {
      widget.controller.text = titleName.toString();
    });
  }

  @override
  void initState() {
    widget.controller.text = widget.items.first.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.items.map((tileIdentifier) => RadioButtonModified(
        controller: widget.controller,
        tileName: tileIdentifier,
        maxLength: widget.items.length,
        index: widget.items.indexOf(tileIdentifier),
        onClick: onClick,
      )).toList(),
    );
  }
}


class RadioButtonModified extends StatefulWidget {
  final TextEditingController controller;
  final String tileName;
  final int maxLength;
  final int index;
  final Function onClick;
  const RadioButtonModified({Key? key, required this.controller, required this.tileName, required this.maxLength, required this.index, required this.onClick}) : super(key: key);

  @override
  State<RadioButtonModified> createState() => _RadioButtonModifiedState();
}

class _RadioButtonModifiedState extends State<RadioButtonModified> {

  final stateController = MaterialStatesController();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: (widget.maxLength == widget.index)? const EdgeInsets.only(right: 0) : const EdgeInsets.only(right: 5),
        child: Material(
          color: ConfigColor.scaffoldColor,
          borderRadius: BorderRadius.circular(10),
          child: RadioMenuButton(
            value: widget.tileName,
            toggleable: true,
            groupValue: widget.controller.text.toString(),
            statesController: stateController,
            onChanged: (value){
              widget.onClick(value);
            },
            child: Text(widget.tileName ,style: TextDesignConfig().bodySubText ,overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }
}

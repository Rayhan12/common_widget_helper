
import 'package:flutter/material.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';



class StatusChip extends StatefulWidget {
  final String label;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  const StatusChip({Key? key, required this.label, this.radius, this.backgroundColor, this.textStyle, this.padding}) : super(key: key);

  @override
  State<StatusChip> createState() => _StatusChipState();
}

class _StatusChipState extends State<StatusChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? MyColor.purple,
        borderRadius: widget.radius ?? BorderRadius.circular(25),
      ),
      child: Text(widget.label ,style: widget.textStyle ?? TextDesign().bodyTextSmall.copyWith(color: MyColor.white)),
    );
  }
}

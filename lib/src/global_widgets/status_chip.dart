
import 'package:flutter/material.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';



class StatusChip extends StatefulWidget {
  final String label;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool? cornerClipChip;
  final EdgeInsetsGeometry? padding;

  const StatusChip(
      {Key? key,
        required this.label,
        this.radius,
        this.backgroundColor,
        this.textStyle,
        this.padding,
        this.cornerClipChip})
      : super(key: key);

  @override
  State<StatusChip> createState() => _StatusChipState();
}

class _StatusChipState extends State<StatusChip> {
  bool cornerClipChip = false;

  @override
  void initState() {
    cornerClipChip = widget.cornerClipChip ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? ConfigColor.purple,
        borderRadius: widget.radius == null && !cornerClipChip
            ? BorderRadius.circular(25)
            : cornerClipChip && widget.radius == null
            ? const BorderRadius.only(
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        )
            : widget.radius,
      ),
      child: Text(widget.label,
          style: widget.textStyle ??
              TextDesignConfig().bodyTextSmall.copyWith(color: ConfigColor.white)),
    );
  }
}

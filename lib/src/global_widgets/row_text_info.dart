import 'package:flutter/material.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';



class RowTextInfo extends StatefulWidget {
  final String title;
  final String information;
  final Color? titleColor;
  final Color? informationColor;
  final TextStyle? titleStyle;
  final TextStyle? informationStyle;
  final double? titleWidth;
  final double? subTitleWidth;
  final int? titleMaxLine;
  final int? subTitleMaxLine;
  const RowTextInfo(
      {Key? key,
        required this.title,
        required this.information,
        this.titleStyle,
        this.informationStyle,
        this.titleColor,
        this.informationColor,
        this.titleWidth,
        this.titleMaxLine,
        this.subTitleWidth,
        this.subTitleMaxLine})
      : super(key: key);

  @override
  State<RowTextInfo> createState() => _RowTextInfoState();
}

class _RowTextInfoState extends State<RowTextInfo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: widget.titleWidth ?? size.width * .3,
            child: Text(widget.title,
                maxLines: widget.titleMaxLine ?? 1,
                overflow: TextOverflow.ellipsis,
                style: widget.titleStyle ??
                    TextDesignConfig().bodyTextSmall.copyWith(
                        color: widget.titleColor ?? ConfigColor.textLightBlack))),
        SizedBox(
            width: widget.subTitleWidth ?? size.width * .3,
            child: Text(widget.information,
                textAlign: TextAlign.end,
                maxLines: widget.subTitleMaxLine ?? 1,
                overflow: TextOverflow.ellipsis,
                style: widget.informationStyle ??
                    TextDesignConfig().pageTitle.copyWith(
                        color: widget.informationColor ?? ConfigColor.textBlack))),
      ],
    );
  }
}

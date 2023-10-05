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
  const RowTextInfo({Key? key, required this.title, required this.information, this.titleStyle, this.informationStyle, this.titleColor, this.informationColor}) : super(key: key);

  @override
  State<RowTextInfo> createState() => _RowTextInfoState();
}

class _RowTextInfoState extends State<RowTextInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title ,style: widget.titleStyle ?? TextDesignConfig().bodyTextSmall.copyWith(color:widget.titleColor??  ConfigColor.textLightBlack)),
        Text(widget.information ,style:widget.informationStyle ?? TextDesignConfig().pageTitle.copyWith(color: widget.informationColor?? ConfigColor.textBlack)),
      ],
    );
  }
}
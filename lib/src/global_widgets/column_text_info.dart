

import 'package:flutter/cupertino.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';


class ColumnTextInfo extends StatelessWidget {
  final String title;
  final String information;
  final bool isLeftAligned;
  final Color? titleColor;
  final Color? informationColor;
  final TextStyle? titleStyle;
  final TextStyle? informationStyle;
  const ColumnTextInfo({Key? key, required this.title, required this.information, required this.isLeftAligned, this.titleColor, this.informationColor, this.titleStyle, this.informationStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isLeftAligned ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(title ,style: titleStyle ?? TextDesign().bodyTextExtraSmall.copyWith(color: titleColor ?? MyColor.textLightBlack)),
        Text(information ,style: informationStyle ?? TextDesign().pageTitle.copyWith(color: informationColor ?? MyColor.textBlack)),
      ],
    );
  }
}




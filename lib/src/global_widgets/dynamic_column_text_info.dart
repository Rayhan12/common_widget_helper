import 'package:flutter/material.dart';

import '../config_files/color_config.dart';
import '../config_files/text_config.dart';



class DynamicColumnTextInfo extends StatelessWidget {
  final String title;
  final String information;
  final bool isLeftAligned;
  final Color? titleColor;
  final Color? informationColor;
  final TextStyle? titleStyle;
  final TextStyle? informationStyle;
  final double widthTittle;
  final double widthInformation;
  final int? tittleMaxLine;
  final int? informationMaxLine;

  const DynamicColumnTextInfo(
      {Key? key,
      required this.title,
      required this.information,
      required this.isLeftAligned,
      this.titleColor,
      this.informationColor,
      this.titleStyle,
      this.informationStyle,
      required this.widthTittle,
      required this.widthInformation,
      this.tittleMaxLine,
      this.informationMaxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          isLeftAligned ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        SizedBox(
            width: widthTittle,
            child: Text(
              textAlign: isLeftAligned ? TextAlign.start : TextAlign.end,
              title,
              style: titleStyle ??
                  TextDesignConfig()
                      .bodyTextExtraSmall
                      .copyWith(color: titleColor ?? ConfigColor.textLightBlack),
              maxLines: tittleMaxLine ?? 1,
              overflow: TextOverflow.ellipsis,
            )),
        SizedBox(
            width: widthInformation,
            child: Text(
              textAlign: isLeftAligned ? TextAlign.start : TextAlign.end,
              information,
              style: informationStyle ??
                  TextDesignConfig()
                      .pageTitle
                      .copyWith(color: informationColor ?? ConfigColor.textBlack),
              maxLines: informationMaxLine ?? 1,
              overflow: TextOverflow.ellipsis,
            )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_config.dart';



class TextDesignConfig{
  TextStyle headerText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: ConfigColor.textBlack

  );

  TextStyle pageTitle = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w700,
      color: ConfigColor.textBlack

  );

  TextStyle bodyTextLarge = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
      color: ConfigColor.textBlack

  );
  TextStyle bodyTextSmall = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
      color: ConfigColor.textLightBlack

  );

  TextStyle bodySubText = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
      color: ConfigColor.textLightBlack

  );

  TextStyle bodyTitle = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w700,
      color: ConfigColor.textBlack

  );

  TextStyle bodyTextExtraSmall = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
      color: ConfigColor.textLightBlack

  );

  TextStyle smallTitle = GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: ConfigColor.textLightBlack
  );

  TextStyle dashboardWidgetTitle = GoogleFonts.nunito(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      color: ConfigColor.textLightBlack
  );

  TextStyle popSemi = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: ConfigColor.textLightBlack
  );

  TextStyle popRegular = GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: ConfigColor.textLightBlack
  );

  TextStyle popHead = GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: ConfigColor.textLightBlack
  );




}

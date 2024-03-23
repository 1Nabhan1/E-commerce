import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dimensions.dart';

class Fontstyle {
  static final Default_txt = GoogleFonts.aBeeZee(
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.fontSizeDefault,
  );
  static final Field_txt = GoogleFonts.aBeeZee(
      fontWeight: FontWeight.w400,
      color: Colors.blue,
      fontSize: Dimensions.fontSizeDefault);
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const primaryColor = Color(0xFF05478A);
const secondaryColor = Color(0xFF0057D9);
const disbaledButton = Color(0xFFC4E5FF);
const textColorPrimary = Color(0xFF333333);
const textColorSecondary = Color(0xFF8F9AA0);
const textColorTetiary = Color(0xFF8F0CB0);
const cardRadialColor01 = Color(0xFF8F9AA0);
const textfieldColor = Color(0xFFF8F8F8);
const texdColor01 = Color(0xFF8F9AA0);

const cardRa = Color(0xff048cfc26);
const cardRa1 = Color(0xff048cfc);
const iconColor = Color(0xFFDCE5EF);
const whiteColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF333333);
const textFieldBorderColor = Color(0xFFDFE2E4);
const star2 = Color(0xFFD9D9D9);
const background01 = Color(0xFFF3F4F6);
const background02 = Color.fromRGBO(243, 244, 246, 1);
const btnDisabled = Color(0xFFC4E5FF);

const colrs = Color.fromRGBO(4, 140, 252, 0.15);

// Target Font Size (T)	Factor Multiplier (F)
// 1	0.000003125
// 2	0.00000625
// 3	0.000009375
// 4	0.0000125
// 5	0.000015625
// 6	0.00001875
// 7	0.000021875
// 8	0.000025
// 9	0.000028125
// 10	0.00003125
// 11	0.000034375
// 12	0.0000375
// 13	0.000040625
// 14	0.00004375
// 15	0.000046875
// 16	0.00005
// 17	0.000053125
// 18	0.00005625
// 19	0.000059375
// 20	0.0000625
// 21	0.000065625
// 22	0.00006875
// 23	0.000071875
// 24	0.000075
// 25	0.000078125
// 26	0.00008125
// 27	0.000084375
// 28	0.0000875
// 29	0.000090625
// 30	0.00009375
// 31	0.000096875
// 32	0.0001
// 33	0.000103125
// 34	0.00010625
// 35	0.000109375
// 36	0.0001125
// 37	0.000115625
// 38	0.00011875
// 39	0.000121875
// 40	0.000125
// 41	0.000128125
// 42	0.00013125
// 43	0.000134375
// 44	0.0001375
// 45	0.000140625
// 46	0.00014375
// 47	0.000146875
// 48	0.00015
// 49	0.000153125
// 50	0.00015625
// 51	0.000159375
// 52	0.0001625
// 53	0.000165625
// 54	0.00016875
// 55	0.000171875
// 56	0.000175
// 57	0.000178125
// 58	0.00018125
// 59	0.000184375
// 60	0.0001875
// 61	0.000190625
// 62	0.00019375
// 63	0.000196875
// 64	0.0002
// 65	0.000203125
// 66	0.00020625
// 67	0.000209375
// 68	0.0002125
// 69	0.000215625
// 70	0.00021875
// 71	0.000221875
// 72	0.000225
// 73	0.000228125
// 74	0.00023125
// 75	0.000234375
// 76	0.0002375
// 77	0.000240625
// 78	0.00024375
// 79	0.000246875
// 80	0.00025
// 81	0.000253125
// 82	0.00025625
// 83	0.000259375
// 84	0.0002625
// 85	0.000265625
// 86	0.00026875
// 87	0.000271875
// 88	0.000275
// 89	0.000278125
// 90	0.00028125
// 91	0.000284375
// 92	0.0002875
// 93	0.000290625
// 94	0.00029375
// 95	0.000296875
// 96	0.0003
// 97	0.000303125
// 98	0.00030625
// 99	0.000309375
// 100	0.0003125

Text w700_27(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000084375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 27,
      height: 32.68 / 27,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w700_24(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000075 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 24,
      height: 29.05 / 24,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w700_20(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 21.5,
      height: 21.5 / 26.02,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w700_18(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00005625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 18,
      height: 18 / 21.78,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w700_17(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 17.55,
      height: 21.24 / 17,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w700_17_02(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 17,
      height: 20.57 / 17,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w700_16(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00005 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 16,
      height: 19.26 / 16,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w400_27(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000084375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_20(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 20,
      height: 24.2 / 20,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_44(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0001375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_14(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 16.94 / 14,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_14_textAlign_C(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 16.94 / 14,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_14_02(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_14_d(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    maxLines: 1, // Ensure it stays in one line
    style: GoogleFonts.inter(
      textStyle: TextStyle(
        overflow: TextOverflow.ellipsis, // Add dots at the end),
      ),
      fontSize: 14,
      height: 16.94 / 14,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_14_soft_wrap(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    textAlign: TextAlign.center,
    softWrap: true,
    style: GoogleFonts.inter(
      textStyle: TextStyle(),
      fontSize: 14,
      height: 16.94 / 14,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w500_14(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 16.94 / 14,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w500_14_05(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    softWrap: true, // Moves to next line
    text,
    style: GoogleFonts.inter(
      fontSize: 14.45,
      height: 17.49 / 14.45,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w500_14_03(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 24 / 14,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w500_14_04(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 40 / 14,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w500_14_02(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w500_16(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00005 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 16,
      height: 16 / 19.36,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w400_12(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 12.53,
      height: 15.16 / 12.53,
      fontWeight: FontWeight.w400,
      textStyle: TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      color: color,
    ),
  );
}

Text w400_12_o(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    softWrap: true, // Moves to next line
    text,
    style: GoogleFonts.inter(
      fontSize: 12.53,
      height: 15.16 / 12.53,
      fontWeight: FontWeight.w400,
      textStyle: TextStyle(),
      color: color,
    ),
  );
}

Text w400_11(String text, Color color) {
  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 11,
      height: 13 / 11,
      fontWeight: FontWeight.w400,
      textStyle: TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      color: color,
    ),
  );
}

Text w400_10(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 10,
      height: 12.1 / 10,
      fontWeight: FontWeight.w400,
      textStyle: TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      color: color,
    ),
  );
}

Text w400_12_02(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w500_17(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
        fontSize: 17,
        height: 25 / 17,
        fontWeight: FontWeight.w500,
        color: color,
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
        )),
  );
}

Text w500_17_soft_wrap(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    softWrap: true, // Moves to next line
    text,
    style: GoogleFonts.inter(
        fontSize: 17,
        height: 25 / 17,
        fontWeight: FontWeight.w500,
        color: color,
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
        )),
  );
}

Text w500_17_03(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
        fontSize: 17,
        height: 40 / 17,
        fontWeight: FontWeight.w500,
        color: color,
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
        )),
  );
}

Text w500_17_02(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w400_16(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00005 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 16,
      height: 16.94 / 16,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_14_mo(
    BuildContext context, String text, Color color, maxLines, overflow) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    maxLines: maxLines,
    overflow: overflow,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      textStyle: TextStyle(
        overflow: TextOverflow.visible, // Let text overflow naturally
      ),
    ),
  );
}

Text w400_16_u(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00005 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      decoration: TextDecoration.underline,
      decorationColor: Colors.blue,
    ),
  );
}

Text w500_08(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000025 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w400_08(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000025 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w500_24(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000075 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 24,
      height: 29.05 / 24,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w500_24_r(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000075 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.rubik(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w500_21(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000065625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 21.86,
      height: 26.24 / 21.86,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w500_20(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 20,
      height: 24.2 / 20,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w500_12(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 12,
      height: 14.52 / 12,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w700_12(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 12,
      height: 24 / 12,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w700_12_sw(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    softWrap: true,
    text,
    style: GoogleFonts.inter(
      fontSize: 12,
      height: 24 / 12,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w700_14(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 16.8 / 14,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w600_17(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w600_17_02(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    softWrap: true, // Allows text to wrap to the next line
    overflow: TextOverflow.visible, // Ensures no truncation
    style: GoogleFonts.inter(
      textStyle: TextStyle(
        height: 20.57 / 17,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      fontSize: 17,
    ),
  );
}

Text w600_15(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 15,
      height: 18.15 / 15,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w600_18(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00005625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 18,
      height: 21.78 / 18,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w600_12(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w600_11(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 11,
      height: 13.31 / 11,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w600_26(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00008125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 26,
      height: 31.47 / 26,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w600_20(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 20,
      height: 24.2 / 20,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w600_20_02(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 20,
      height: 23.7 / 20,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w400_16_k(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00005 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.keaniaOne(
      fontSize: 16,
      height: 19.47 / 16,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w800_12(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      color: color,
    ),
  );
}

Text w500_10(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00003125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 10,
      height: 12.1 / 10,
      fontWeight: FontWeight.w500,
      color: color,
    ),
  );
}

Text w300_12(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color,
    ),
  );
}

Text w600_14(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 16.94 / 14,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w600_14_02(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    softWrap: true,
    style: GoogleFonts.inter(
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w700_35(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000109375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 35,
      height: 41.48 / 35,
      fontWeight: FontWeight.w700,
      color: color,
    ),
  );
}

Text w800_40(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 40,
      height: 48.41 / 40,
      fontWeight: FontWeight.w800,
      color: color,
    ),
  );
}

Text w800_30(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 30,
      height: 48.41 / 30,
      fontWeight: FontWeight.w800,
      color: color,
    ),
  );
}

Text w400_17(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 17,
      height: 20.57 / 17,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_17_wC(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000053125 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.inter(
      fontSize: 17,
      height: 20.57 / 17,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_13(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000040625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_15(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000040625 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 15,
      height: 18.15 / 15,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_06(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00001875 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w600_24(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000075 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    ),
  );
}

Text w800_24(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.000075 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      color: color,
    ),
  );
}

Text w400_12_r(BuildContext context, String text, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width

  return Text(
    text,
    style: GoogleFonts.rubik(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

// Text w400_11(String text, Color color) {
//   return Text(
//     text,
//     style: GoogleFonts.inter(
//       fontSize: 11,
//       height: 13 / 11,
//       fontWeight: FontWeight.w400,
//       color: color,
//     ),
//   );
// }

Text w400_11_03(String text, Color color) {
  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 11,
      height: 12 / 11,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_11_04(String text, Color color) {
  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 11,
      height: 25 / 11,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_11_soft_wrap(String text, Color color) {
  return Text(
    softWrap: true, // Moves to next line
    text,
    style: GoogleFonts.inter(
      fontSize: 11,
      height: 25 / 11,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_11_02_soft_wrap(String text, Color color) {
  return Text(
    softWrap: true, // Moves to next line
    text,
    style: GoogleFonts.inter(
      fontSize: 11,
      height: 14 / 11,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

Text w400_11_02(String text, Color color) {
  return Text(
    text,
    style: GoogleFonts.rubik(
      fontSize: 11,
      height: 25 / 11,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

TextStyle buttonText04Style(Color color) {
  return GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle w400_12_s(BuildContext context, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width
  return GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle w400_11_s(BuildContext context, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width
  return GoogleFonts.inter(
    fontSize: 11,
    height: 14 / 11,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle w400_14_s(BuildContext context, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.0000375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width
  return GoogleFonts.inter(
    fontSize: 11,
    height: 14 / 11,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle w500_14_s(BuildContext context, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width
  return GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle w400_17_s(BuildContext context, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width
  return GoogleFonts.inter(
    fontSize: 17,
    height: 24 / 17,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle w700_17_s(BuildContext context, Color color) {
  final screenSize = MediaQuery.of(context).size;
  double fontSize = 0.00004375 *
      screenSize.width *
      screenSize
          .height; // Example formula to set font size relative to screen width
  return GoogleFonts.inter(
    fontSize: 17,
    height: 24 / 17,
    fontWeight: FontWeight.w700,
    color: color,
  );
}

TextStyle buttonText06Style(Color color) {
  return GoogleFonts.inter(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

SvgPicture svgAsset(String assetName) {
  return SvgPicture.asset(
    assetName,
    // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
    semanticsLabel: 'A red up arrow',
  );
}

SvgPicture svgAssetCo(String assetName, ColorFilter color) {
  return SvgPicture.asset(
    assetName,
    colorFilter: color,
    semanticsLabel: 'A red up arrow',
  );
}

class ScreenSize {
  double screenWidth;
  double screenHeight;
  ScreenSize(
    this.screenWidth,
    this.screenHeight,
  );
}

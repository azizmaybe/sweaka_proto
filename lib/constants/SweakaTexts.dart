import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';

class SweakaText {
  static const String fontFamilly = "Noto Sans";

  //Heading 1

  static const TextStyle heading_1 = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.w900,
    fontFamily: fontFamilly,
  );

  //Heading 2

  static const TextStyle heading_2 = TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilly,
  );

  //Heading 3

  static const TextStyle heading_3 = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilly,
  );

  //Heading 4

  static const TextStyle heading_4 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilly,
  );

  //Heading 5

  static const TextStyle heading_5 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilly,
  );

  //Heading 6

  static const TextStyle heading_6 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilly,
  );

  //Body Large

  static const TextStyle body_large = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamilly,
  );

  //Body Medium

  static const TextStyle body_medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamilly,
    color: SweakaColors.secondary_text
  );

  //Body Small

  static const TextStyle body_small = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamilly,
    color: SweakaColors.primary_text,
  );

  //Button

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilly,
    color: SweakaColors.white

  );

  //Overline

  static const TextStyle overline = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamilly,
      color: SweakaColors.secondary_text
  );

  //Title

  static const TextStyle Title = TextStyle(
   color: SweakaColors.primary_text,
   fontWeight: FontWeight.w600,
   fontSize: 14,
   fontFamily: fontFamilly,

  );

  //subtitle

  static const TextStyle Subtitle = TextStyle(
  color: SweakaColors.primary_text,
  fontSize: 9,
  fontWeight: FontWeight.w400,
  fontFamily: fontFamilly,

   );

   //TextFormField title

  static const TextStyle textfieldTitle = TextStyle(
  color: SweakaColors.primary_text,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  fontFamily: fontFamilly,
  );


  //hint Text

  static const TextStyle hintText1 = TextStyle(
   color: SweakaColors.grey_scale_4,
   fontWeight: FontWeight.w400,
   fontSize: 12,
   fontFamily: fontFamilly,

   );

    //textfield text

  static const TextStyle textfield_text = TextStyle(
   color: SweakaColors.primary_text,
   fontWeight: FontWeight.w400,
   fontSize: 12,
   fontFamily: fontFamilly,

   );
   

    // Notification Subtitle

    static const TextStyle notif_subtitle = TextStyle(
     fontWeight: FontWeight.w700,
     fontSize: 10,
     color: SweakaColors.shadow_2,
     fontFamily: fontFamilly,

     );

      // Notification Title

    static const TextStyle notif_title = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 10,
    color: SweakaColors.white,
    fontFamily: fontFamilly,

     );

       // Menu

    static const TextStyle menu = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Color(0xFF787E95),
    fontFamily: fontFamilly,
     );

     // suybtitle Client / secteur

    static const TextStyle title_Client = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: SweakaColors.primaryColor,
    fontFamily: fontFamilly,
     );

     // subtitle Client / secteur

    static const TextStyle subtitle_Client = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: SweakaColors.light_text,
    fontFamily: fontFamilly,
     );
   }

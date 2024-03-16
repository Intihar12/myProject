import 'package:flutter/material.dart';
import 'package:taskproject/res/colors/app_color.dart';
import 'package:taskproject/res/size_config/size_config.dart';

class TextStyles {
  // static TextStyle hintNormalTextStyle = TextStyle(
  //   fontFamily: AppFonts.rubik,
  //   color: Colors.grey,
  //   fontSize: getFont(14.0),
  // );
// todo font size 12

  static TextStyle textStyle18 =
      TextStyle(color: AppColor.blackColor, fontSize: getFont(18.0), fontWeight: FontWeight.w700);
  static TextStyle textColorWhite =
      TextStyle(color: AppColor.white, fontSize: getFont(12.0), fontWeight: FontWeight.w500);
  static TextStyle textColorGreen =
      TextStyle(color: AppColor.greenColor, fontSize: getFont(12.0), fontWeight: FontWeight.w500);
  static TextStyle textColorGreen14 =
      TextStyle(color: AppColor.greenColor, fontSize: getFont(14.0), fontWeight: FontWeight.w500);
  static TextStyle textStyle12 =
      TextStyle(color: AppColor.blackColor, fontSize: getFont(12.0), fontWeight: FontWeight.w500);
}

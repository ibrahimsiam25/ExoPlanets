import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LatoTextStyle extends TextStyle {
  const LatoTextStyle({
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.color,
    super.letterSpacing,
    super.height,
    super.decoration,
  }) : super(
          fontFamily: 'Lato',
        );
}

class AppTextStyles {
  const AppTextStyles._();

  //naming ==> fontSizeColorWeight
  static TextStyle font20DarkW600 = LatoTextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static TextStyle font15WhiteW500 = LatoTextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle font12WhiteW600 = LatoTextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font10WhiteW600 = LatoTextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font12GreyW400 = LatoTextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
  );
  static TextStyle font10WhiteNormal = LatoTextStyle(
    fontSize: 10.0.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );
  static TextStyle font19WhiteW600 = LatoTextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font21WhiteW500 = LatoTextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle font22WhiteW600 = LatoTextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font50WhiteW600 = LatoTextStyle(
    fontSize: 50.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font40RedW600 = LatoTextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.lightRed,
  );
  static TextStyle font63WhiteW600 = LatoTextStyle(
    fontSize: 63.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font26WhiteW600 = LatoTextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font27WhiteW700 = LatoTextStyle(
    fontSize: 27.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle font14GrayW400 = LatoTextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle font20WhiteW600 = LatoTextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font20RedW600 = LatoTextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.lightRed,
  );
  static TextStyle font28VeryLightGrayW500 = LatoTextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.veryLightGray,
  );
  static TextStyle font28WhiteW700 = LatoTextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle font12LightGrayW400 = LatoTextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGrey9A,
  );
  static TextStyle font14GreyW400 = LatoTextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
  );
  static TextStyle font24WhiteW600 = LatoTextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font27LightGreyW600 = LatoTextStyle(
    fontSize: 27.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.lightGreyEC,
  );
  static TextStyle font20WhiteW500 = LatoTextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
}

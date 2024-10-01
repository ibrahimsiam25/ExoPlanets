import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class SettingsElement extends StatelessWidget {
  final String title;
  final String image;
  final Color? color;
  final Gradient? gradient;
  final VoidCallback onTap;
  const SettingsElement({
    super.key,
    required this.title,
    required this.image,
    this.color = AppColors.darkGrey,
    required this.onTap,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 18.0.w),
        decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          borderRadius: BorderRadius.circular(18.0.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              hGap(16.0),
              Image.asset(
                width: 32.0.w,
                height: 32.0.h,
                color: AppColors.white,
                image,
              ),
              hGap(16.0),
              Text(
                title,
                style: AppTextStyles.font15WhiteW500,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/constants.dart';

class QuizBottomScreenButton extends StatelessWidget {
  final VoidCallback onTap;
  final int index;
  final Widget? child;
  const QuizBottomScreenButton(
      {super.key, required this.onTap, required this.index, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: Constants.customRedGradient,
        ),
        child: child ??
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Next",
                  style: AppTextStyles.font20WhiteW600,
                ),
                hGap(5),
                SvgPicture.asset(
                  AppAssets.arrowForward,
                  height: 14.h,
                  width: 22.w,
                )
              ],
            ),
      ),
    );
  }
}

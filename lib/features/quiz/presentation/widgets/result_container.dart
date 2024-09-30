import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 25.h),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Image.asset(
              AppAssets.starFill,
              width: 40.w,
              height: 40.h,
            ),
            SizedBox(
              width: 180.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppAssets.starFill,
                    width: 40.w,
                    height: 40.h,
                  ),
                  Image.asset(
                    AppAssets.starStroke,
                    width: 40.w,
                    height: 40.h,
                  ),
                ],
              ),
            ),
            Image.asset(
              AppAssets.trophy,
              height: 80.h,
              width: 60.w,
            ),
            vGap(20),
            Text("6/8 Points", style: AppTextStyles.font22WhiteW600),
            vGap(10),
            Image.asset(
              AppAssets.rocket,
              height: 50.h,
              width: 45.w,
            ),
          ],
        ),
      ),
    );
  }
}

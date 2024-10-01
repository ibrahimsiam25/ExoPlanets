import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_text_styles.dart';

class CustomLeadersWidget extends StatelessWidget {
  final int index;
  const CustomLeadersWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.white.withOpacity(0.1),
              radius: 45.r,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: AppColors.white.withOpacity(0.1),
                radius: 40.r,
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColors.white.withOpacity(0.1),
              radius: 35.r,
              backgroundImage: AssetImage(AppAssets.avatarTest),
            ),
            index == 1
                ? Positioned(
                    top: -10.h,
                    child: SvgPicture.asset(
                      AppAssets.crown,
                      height: 24.h,
                      width: 36.w,
                    ))
                : const SizedBox.shrink(),
            Positioned(
              bottom: -8.h,
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: AppColors.white,
                child: Text("1", style: AppTextStyles.font14BlackW500),
              ),
            )
          ],
        ),
        vGap(10),
        Text(
          "User Name",
          style: AppTextStyles.font15WhiteW600,
        ),
        SizedBox(
          width: 50.w,
          child: Divider(
            color: AppColors.white,
            thickness: 1,
            height: 20.h,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.rocket, height: 20.h, width: 20.w),
            hGap(5),
            Text(
              "542 pts",
              style: AppTextStyles.font12WhiteW600,
            )
          ],
        )
      ],
    );
  }
}

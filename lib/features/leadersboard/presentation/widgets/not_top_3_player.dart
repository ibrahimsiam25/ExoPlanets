import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class NotTop3Player extends StatelessWidget {
  const NotTop3Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18.r,
          ),
          color: AppColors.selectedAnswerGrey.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Text(
              "4",
              style: AppTextStyles.font15WhiteW500,
            ),
            hGap(16),
            CircleAvatar(
              radius: 21.r,
              backgroundImage: const AssetImage(AppAssets.avatarTest),
            ),
            hGap(16),
            SizedBox(
                width: context.width * 0.3,
                child: Text(
                  "User Name",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font15WhiteW500,
                )),
            const Spacer(
              flex: 3,
            ),
            const Text("36 pts"),
            const Spacer()
          ],
        ));
  }
}

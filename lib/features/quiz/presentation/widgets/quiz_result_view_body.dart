import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_bottom_screen_button.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_views_background.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/result_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_text_styles.dart';

class QuizResultViewBody extends StatelessWidget {
  final int score;
  const QuizResultViewBody({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return QuizViewsBackground(
        child: Column(
      children: [
        vGap(90),
        Align(
            alignment: Alignment.center,
            child: Text(score >= 4 ? "Victory" : "Defeat",
                style: AppTextStyles.font40RedW600)),
        vGap(90),
        ResultContainer(
          score: score,
        ),
        vGap(50),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: QuizBottomScreenButton(
            onTap: () {},
            index: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Return Home",
                  style: AppTextStyles.font19WhiteW600,
                ),
                hGap(10),
                SvgPicture.asset(
                  AppAssets.homeIcon,
                  height: 20.h,
                  width: 20.w,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/routes/app_router.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/custom_hollow_button.dart';
import 'package:exo_planets/features/quiz/data/models/quiz%20navigation/quiz_navigation.dart';
import 'package:exo_planets/features/quiz/data/models/result%20navigation/result_navigation.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_bottom_screen_button.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_views_background.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/result_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_text_styles.dart';

class QuizResultViewBody extends StatelessWidget {
  final ResultNavigation result;
  const QuizResultViewBody({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return QuizViewsBackground(
        child: SingleChildScrollView(
      child: Column(
        children: [
          vGap(80),
          Align(
              alignment: Alignment.center,
              child: Text(result.score >= 4 ? "Victory" : "Defeat",
                  style: AppTextStyles.font40RedW600)),
          Text(
            "Keep up the momentum and hold on to your passion for learning!",
            textAlign: TextAlign.center,
            style: AppTextStyles.font14GrayW400
                .copyWith(color: AppColors.textGrey),
          ),
          vGap(18),
          ResultContainer(
            score: result.score,
          ),
          vGap(20),
          QuizBottomScreenButton(
            verticalPadding: 20.h,
            onTap: () {
              context.pushReplacementNamed(AppRouter.bottomNavigationBar);
            },
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
          vGap(15),
          CustomHollowButton(
            text: "Review your answers",
            onTap: () {
              context.pushNamed(AppRouter.quiz,
                  arguments: QuizNavigation(
                      selectedAnswers: result.selectedAnswers,
                      questions: result.questions,
                      isReviewing: true));
            },
          )
        ],
      ),
    ));
  }
}

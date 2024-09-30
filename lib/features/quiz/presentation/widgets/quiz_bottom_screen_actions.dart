import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_bottom_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizBottomScreenActions extends StatelessWidget {
  const QuizBottomScreenActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Opacity(
            opacity: 0.5,
            child: QuizBottomScreenButton(
              onTap: () {},
              index: 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.arrowBack),
                  hGap(5),
                  Text(
                    "Back",
                    style: AppTextStyles.font20WhiteW600,
                  ),
                ],
              ),
            ),
          ),
        ),
        hGap(20),
        Expanded(
          child: QuizBottomScreenButton(
            onTap: () {},
            index: 1,
          ),
        ),
      ],
    );
  }
}

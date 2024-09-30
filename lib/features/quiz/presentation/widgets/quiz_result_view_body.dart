import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_views_background.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/result_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class QuizResultViewBody extends StatelessWidget {
  const QuizResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizViewsBackground(
        child: Column(
      children: [
        vGap(90),
        Align(
            alignment: Alignment.center,
            child: Text("Victory", style: AppTextStyles.font40RedW600)),
        vGap(90),
        const ResultContainer()
      ],
    ));
  }
}

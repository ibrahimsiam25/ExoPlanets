import 'package:exo_planets/core/helpers/constants.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../home/presentation/widgets/custom_home_app_bar.dart';
import 'planet_quiz_item.dart';

class SelectQuizViewBody extends StatelessWidget {
  const SelectQuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          vGap(16),
          const CustomHomeAppBar(),
          vGap(18),
          Text(
            "Discover how close you are to becoming an expert in the mysteries of the universe!",
            textAlign: TextAlign.center,
            style: AppTextStyles.font12GreyW400,
          ),
          vGap(16),
          Expanded(
            child: ListView.separated(
              itemCount: Constants.quizImages.length,
              itemBuilder: (context, index) {
                return PlanetQuizItem(
                  index: index,
                );
              },
              separatorBuilder: (context, index) => vGap(10),
            ),
          )
        ],
      ),
    );
  }
}

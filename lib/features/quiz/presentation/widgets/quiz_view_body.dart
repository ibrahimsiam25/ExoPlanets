import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/answer%20cubit/answer_cubit.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_question_number_close_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'question_answer_item.dart';
import 'quiz_bottom_screen_actions.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.earthImage,
          height: context.height * 0.3,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vGap(25),
              const QuizQuestionNumberCloseRow(),
              vGap(40),
              Text(
                "Question 1 ",
                style: AppTextStyles.font12WhiteW600,
              ),
              vGap(5),
              Text(
                "What is the biggest planet in our solar system?",
                style: AppTextStyles.font28WhiteW700,
              ),
              vGap(40),
              BlocBuilder<AnswerCubit, AnswerState>(
                builder: (context, state) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => QuestionAnswerItem(
                            index: index,
                          ),
                      separatorBuilder: (context, index) => vGap(12),
                      itemCount: 4);
                },
              ),
              vGap(47),
              const Spacer(),
              const QuizBottomScreenActions()
            ],
          ),
        )
      ],
    );
  }
}

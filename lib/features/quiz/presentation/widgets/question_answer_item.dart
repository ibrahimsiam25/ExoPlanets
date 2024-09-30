import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/answer%20cubit/answer_cubit.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/stroked_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';

class QuestionAnswerItem extends StatelessWidget {
  final int index;
  final int questionIndex;
  final List<String> options;
  final String correctAnswer;
  const QuestionAnswerItem(
      {super.key,
      required this.index,
      required this.options,
      required this.correctAnswer,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AnswerCubit>().selectAnswer(index, questionIndex);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: context.read<AnswerCubit>().selectedAnswers[questionIndex] ==
                    index
                ? AppColors.selectedAnswerGrey
                : AppColors.answergrey),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                options[index],
                maxLines: 3,
                style: AppTextStyles.font19WhiteW600.copyWith(
                  color: context
                              .read<AnswerCubit>()
                              .selectedAnswers[questionIndex] ==
                          index
                      ? AppColors.black
                      : AppColors.white,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                StrokedCircle(
                    radius: 10.r,
                    strokeWidth: 2,
                    color: context
                                .read<AnswerCubit>()
                                .selectedAnswers[questionIndex] ==
                            index
                        ? AppColors.black
                        : AppColors.white),
                context.read<AnswerCubit>().selectedAnswers[questionIndex] ==
                        index
                    ? CircleAvatar(
                        backgroundColor: AppColors.black, radius: 6.5.r)
                    : StrokedCircle(
                        radius: 6.5.r, strokeWidth: 2, color: AppColors.white),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/answer%20cubit/answer_cubit.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/update%20points%20cubit/update_points_cubit.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_question_number_close_row.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_views_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/DI/dependency_injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../data/models/question.dart';
import 'question_answer_item.dart';
import 'quiz_bottom_screen_actions.dart';

class QuizViewBody extends StatefulWidget {
  final List<Question> questions;
  const QuizViewBody({super.key, required this.questions});

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  incrementQuestionIndex() async {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      for (int i = 0; i < widget.questions.length; i++) {
        if (context.read<AnswerCubit>().selectedAnswers[i] != null &&
            widget.questions[i]
                    .options[context.read<AnswerCubit>().selectedAnswers[i]!] ==
                widget.questions[i].correctAnswer) {
          context.read<AnswerCubit>().score++;
        }
      }
      if (getIt.get<FirebaseAuth>().currentUser != null &&
          !getIt.get<FirebaseAuth>().currentUser!.isAnonymous) {
        await context
            .read<UpdatePointsCubit>()
            .updatePoints(points: context.read<AnswerCubit>().score);
      }
      if (mounted) {
        context.pushReplacementNamed(AppRouter.quizResult,
            arguments: context.read<AnswerCubit>().score);
      }
    }
  }

  decrementQuestionIndex() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  int currentQuestionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QuizViewsBackground(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vGap(25),
                  const QuizQuestionNumberCloseRow(),
                  vGap(40),
                  Text(
                    "Question ${currentQuestionIndex + 1}",
                    style: AppTextStyles.font12WhiteW600,
                  ),
                  vGap(5),
                  Text(
                    widget.questions[currentQuestionIndex].question,
                    style: AppTextStyles.font28WhiteW700,
                  ),
                  vGap(40),
                  BlocBuilder<AnswerCubit, AnswerState>(
                    builder: (context, state) {
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => QuestionAnswerItem(
                                index: index,
                                options: widget
                                    .questions[currentQuestionIndex].options,
                                correctAnswer: widget
                                    .questions[currentQuestionIndex]
                                    .correctAnswer,
                                questionIndex: currentQuestionIndex,
                              ),
                          separatorBuilder: (context, index) => vGap(12),
                          itemCount: widget
                              .questions[currentQuestionIndex].options.length);
                    },
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vGap(47),
                  const Spacer(),
                  QuizBottomScreenActions(
                    onBackPressed: () {
                      decrementQuestionIndex();
                    },
                    onNextPressed: () {
                      incrementQuestionIndex();
                    },
                  ),
                ],
              ),
            )
          ],
        )),
        BlocBuilder<UpdatePointsCubit, UpdatePointsState>(
          builder: (context, state) {
            if (state is UpdatePointsLoading) {
              return Container(
                height: context.height,
                width: context.width,
                color: AppColors.white.withOpacity(0.1),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.darkerRed,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}

import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/features/quiz/data/models/quiz%20navigation/quiz_navigation.dart';
import 'package:exo_planets/features/quiz/data/models/result%20navigation%20/result_navigation.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/answer%20cubit/answer_cubit.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/update%20points%20cubit/update_points_cubit.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_question_number_close_row.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_views_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/DI/dependency_injection.dart';
import '../../../../core/routes/app_router.dart';
import 'question_answer_item.dart';
import 'quiz_bottom_screen_actions.dart';

class QuizViewBody extends StatefulWidget {
  final QuizNavigation quizNavigation;
  const QuizViewBody({super.key, required this.quizNavigation});

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  incrementQuestionIndex() async {
    if (currentQuestionIndex < widget.quizNavigation.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      for (int i = 0; i < widget.quizNavigation.questions.length; i++) {
        if (context.read<AnswerCubit>().selectedAnswers[i] != null &&
            widget.quizNavigation.questions[i]
                    .options[context.read<AnswerCubit>().selectedAnswers[i]!] ==
                widget.quizNavigation.questions[i].correctAnswer) {
          context.read<AnswerCubit>().score++;
        }
      }
      if (!widget.quizNavigation.isReviewing) {
        if (getIt.get<FirebaseAuth>().currentUser != null &&
            !getIt.get<FirebaseAuth>().currentUser!.isAnonymous) {
          await context
              .read<UpdatePointsCubit>()
              .updatePoints(points: context.read<AnswerCubit>().score);
        }
        if (mounted) {
          context.pushReplacementNamed(AppRouter.quizResult,
              arguments: ResultNavigation(
                  questions: widget.quizNavigation.questions,
                  score: context.read<AnswerCubit>().score,
                  selectedAnswers:
                      context.read<AnswerCubit>().selectedAnswers));
        }
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
                    widget.quizNavigation.questions[currentQuestionIndex]
                        .question,
                    style: AppTextStyles.font28WhiteW700,
                  ),
                  vGap(40),
                  BlocBuilder<AnswerCubit, AnswerState>(
                    builder: (context, state) {
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => QuestionAnswerItem(
                                selectedAnswers:
                                    widget.quizNavigation.selectedAnswers,
                                index: index,
                                isReviewing: widget.quizNavigation.isReviewing,
                                options: widget.quizNavigation
                                    .questions[currentQuestionIndex].options,
                                correctAnswer: widget
                                    .quizNavigation
                                    .questions[currentQuestionIndex]
                                    .correctAnswer,
                                questionIndex: currentQuestionIndex,
                              ),
                          separatorBuilder: (context, index) => vGap(12),
                          itemCount: widget.quizNavigation
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
                    onNextPressed: () async {
                      await incrementQuestionIndex();
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
                color: AppColors.black.withOpacity(0.1),
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

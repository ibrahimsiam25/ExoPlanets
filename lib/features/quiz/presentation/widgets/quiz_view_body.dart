import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/answer%20cubit/answer_cubit.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_question_number_close_row.dart';
import 'package:exo_planets/features/quiz/presentation/widgets/quiz_views_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  incrementQuestionIndex() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
    if (currentQuestionIndex == widget.questions.length - 1) {
      Navigator.pushNamed(context, AppRouter.quizResult);
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
    return QuizViewsBackground(
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
                  itemBuilder: (context, index) => QuestionAnswerItem(
                        index: index,
                        options: widget.questions[currentQuestionIndex].options,
                        correctAnswer: widget
                            .questions[currentQuestionIndex].correctAnswer,
                        questionIndex: currentQuestionIndex,
                      ),
                  separatorBuilder: (context, index) => vGap(12),
                  itemCount: 4);
            },
          ),
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
    );
  }
}

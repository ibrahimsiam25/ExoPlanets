import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/answer%20cubit/answer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/question.dart';
import '../widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    var questions =
        ModalRoute.of(context)!.settings.arguments as List<Question>;
    return CustomScaffold(
      height: context.height,
      body: BlocProvider(
        create: (context) => AnswerCubit(questions.length - 7),
        child: QuizViewBody(questions: questions),
      ),
    );
  }
}

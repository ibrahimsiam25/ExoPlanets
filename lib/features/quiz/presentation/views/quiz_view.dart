import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/quiz/data/models/quiz%20navigation/quiz_navigation.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/answer%20cubit/answer_cubit.dart';
import 'package:exo_planets/features/quiz/presentation/view%20model/update%20points%20cubit/update_points_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    var quizNavigation =
        ModalRoute.of(context)!.settings.arguments as QuizNavigation;
    return CustomScaffold(
      height: context.height,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AnswerCubit(quizNavigation.questions.length),
          ),
          BlocProvider(
            create: (context) => getIt.get<UpdatePointsCubit>(),
          ),
        ],
        child: QuizViewBody(quizNavigation: quizNavigation),
      ),
    );
  }
}

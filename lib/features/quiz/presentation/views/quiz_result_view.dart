import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/quiz/data/models/result%20navigation%20/result_navigation.dart';
import 'package:flutter/material.dart';

import '../widgets/quiz_result_view_body.dart';

class QuizResultView extends StatelessWidget {
  const QuizResultView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ResultNavigation;
    return CustomScaffold(
      body: QuizResultViewBody(result: args),
    );
  }
}

import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/quiz_result_view_body.dart';

class QuizResultView extends StatelessWidget {
  const QuizResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: QuizResultViewBody(),
    );
  }
}

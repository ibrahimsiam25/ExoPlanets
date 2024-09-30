import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../widgets/select_quiz_view_body.dart';

class SelectQuizView extends StatelessWidget {
  const SelectQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SelectQuizViewBody(),
    );
  }
}

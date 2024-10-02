import 'package:exo_planets/features/quiz/data/models/questions/question.dart';

class ResultNavigation {
  final int score;
  final List<int?> selectedAnswers;
  final List<Question> questions;

  ResultNavigation({
    required this.score,
    required this.selectedAnswers,
    required this.questions,
  });
}

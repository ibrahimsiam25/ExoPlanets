import '../questions/question.dart';

class QuizNavigation {
  final List<Question> questions;
  final List<int?>? selectedAnswers;
  bool isReviewing;

  QuizNavigation({
    required this.questions,
    this.isReviewing = false,
    this.selectedAnswers,
  });
}

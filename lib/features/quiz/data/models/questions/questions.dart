import 'question.dart';

class Questions {
  List<Question> questions;

  Questions({required this.questions});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

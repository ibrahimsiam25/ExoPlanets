class Question {
  String question;
  List<String> options;
  String correctAnswer;

  Question(
      {required this.question,
      required this.options,
      required this.correctAnswer});

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json['question'] as String,
        options: json['options'] as List<String>,
        correctAnswer: json['correct_answer'] as String,
      );

  Map<String, dynamic> toJson() => {
        'question': question,
        'options': options,
        'correct_answer': correctAnswer,
      };
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'answer_state.dart';

class AnswerCubit extends Cubit<AnswerState> {
  AnswerCubit(int numberOfQuestions)
      : selectedAnswers = List<int?>.filled(numberOfQuestions, null),
        super(AnswerInitial());
  List<int?> selectedAnswers;
  void selectAnswer(int answer, int questionIndex) {
    if (questionIndex >= selectedAnswers.length) {
      selectedAnswers.add(answer);
    } else {
      selectedAnswers[questionIndex] = answer;
    }
    print(selectedAnswers);
    emit(AnswerSelected());
  }
}

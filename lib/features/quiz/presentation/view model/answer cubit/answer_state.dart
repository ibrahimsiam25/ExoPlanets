part of 'answer_cubit.dart';

@immutable
sealed class AnswerState {}

final class AnswerInitial extends AnswerState {}

final class AnswerSelected extends AnswerState {}

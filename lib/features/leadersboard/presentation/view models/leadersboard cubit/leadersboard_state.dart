part of 'leadersboard_cubit.dart';

@immutable
sealed class LeadersboardState {}

final class LeadersboardInitial extends LeadersboardState {}

final class LeadersboardLoading extends LeadersboardState {}

final class LeadersboardSuccess extends LeadersboardState {}

final class LeadersboardFailure extends LeadersboardState {
  final String errMessage;

  LeadersboardFailure(this.errMessage);
}

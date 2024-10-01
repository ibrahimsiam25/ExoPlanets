part of 'update_points_cubit.dart';

@immutable
sealed class UpdatePointsState {}

final class UpdatePointsInitial extends UpdatePointsState {}

final class UpdatePointsLoading extends UpdatePointsState {}

final class UpdatePointsSuccess extends UpdatePointsState {}

final class UpdatePointsFailure extends UpdatePointsState {
  final String errMessage;

  UpdatePointsFailure({required this.errMessage});
}

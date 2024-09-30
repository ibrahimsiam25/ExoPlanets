part of 'planets_cubit.dart';

@immutable
sealed class PlanetsState {}

final class PlanetsInitial extends PlanetsState {}

final class PlanetsChange extends PlanetsState {}

part of 'get_user_data_cubit.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataSuccess extends UserDataState {
  UserDataSuccess();
}

final class UserDataFailure extends UserDataState {
  final String errMessage;

  UserDataFailure(this.errMessage);
}

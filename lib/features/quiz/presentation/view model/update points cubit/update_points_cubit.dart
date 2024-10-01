import 'package:bloc/bloc.dart';
import 'package:exo_planets/features/quiz/data/repo/update_points_repo.dart';
import 'package:meta/meta.dart';

part 'update_points_state.dart';

class UpdatePointsCubit extends Cubit<UpdatePointsState> {
  UpdatePointsCubit(this.updatePointsRepo) : super(UpdatePointsInitial());

  final UpdatePointsRepo updatePointsRepo;
  Future<void> updatePoints({required int points}) async {
    emit(UpdatePointsLoading());
    var result = await updatePointsRepo.updatePoints(points: points);
    result.fold((failure) {
      emit(UpdatePointsFailure(errMessage: failure.errMessage));
    }, (r) {
      emit(UpdatePointsSuccess());
    });
  }
}

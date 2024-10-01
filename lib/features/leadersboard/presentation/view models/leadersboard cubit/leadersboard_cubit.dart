import 'package:bloc/bloc.dart';
import 'package:exo_planets/core/model/user_model.dart';
import 'package:exo_planets/features/leadersboard/data/repo/leadersboard_repo.dart';
import 'package:meta/meta.dart';

part 'leadersboard_state.dart';

class LeadersboardCubit extends Cubit<LeadersboardState> {
  LeadersboardCubit(this.leadersboardRepo) : super(LeadersboardInitial());
  final LeadersboardRepo leadersboardRepo;
  Stream<List<UserModel>> getLeaders() async* {
    emit(LeadersboardLoading());
    leadersboardRepo.getLeaders().then((either) {
      either.fold(
        (failure) => emit(LeadersboardFailure(failure.errMessage)),
        (leadersStream) {
          leadersStream.listen((leaders) {
            emit(LeadersboardSuccess());
          });
        },
      );
    });
  }
}

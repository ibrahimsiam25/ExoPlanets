import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'leadersboard_state.dart';

class LeadersboardCubit extends Cubit<LeadersboardState> {
  LeadersboardCubit() : super(LeadersboardInitial());

  Stream<List<UserModel>> getLeaders() async* {
    emit(LeadersboardLoading());
    try {
      yield* getIt
          .get<FirebaseFirestore>()
          .collection('users')
          .orderBy("points", descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => UserModel.fromJson(doc.data()))
              .toList());
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(LeadersboardFailure(e.message.toString()));
      }

      emit(LeadersboardFailure("Something went wrong"));
    }
  }
}

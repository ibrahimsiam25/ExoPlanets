import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:exo_planets/core/DI/dependency_injection.dart';
import 'package:exo_planets/core/helpers/upload_file_to_firebase_storage.dart';
import 'package:exo_planets/features/auth/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../model/user_model.dart';

part 'get_user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.authRepo) : super(UserDataInitial());
  UserModel? user;
  final AuthRepo authRepo;
  String? imageUrl;

  Future<void> getUserData() async {
    emit(UserDataLoading());
    var result = await authRepo.getUserFromFirestore();
    result.fold((l) => emit(UserDataFailure(l.errMessage)), (user) {
      this.user = user;
      emit(UserDataSuccess());
    });
  }

  Future<void> updateUserImage(String imagePath) async {
    emit(UserDataLoading());
    String imageUrl = await uploadFileToFirebaseStorage(
        path: "users/${getIt.get<FirebaseAuth>().currentUser!.uid}/profile",
        file: File(imagePath));
    var result = await authRepo.updateUserImage(imageUrl);
    result.fold((l) => emit(UserDataFailure(l.errMessage)),
        (r) => emit(UserDataSuccess()));
  }
}

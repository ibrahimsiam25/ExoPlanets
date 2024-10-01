import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:exo_planets/core/errors/failure.dart';
import 'package:exo_planets/core/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LeadersboardRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  LeadersboardRepo(this.auth, this.firestore);

  Future<Either<Failure, Stream<List<UserModel>>>> getLeaders() async {
    try {
      Stream<List<UserModel>> leadersStream = firestore
          .collection('users')
          .orderBy("points", descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => UserModel.fromJson(doc.data()))
              .toList());

      return right(leadersStream);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseException(e));
      }
      log(e.toString());
      return left(ServerFailure(errMessage: "Something went wrong"));
    }
  }
}

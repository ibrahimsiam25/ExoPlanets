import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';

class UpdatePointsRepo {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  UpdatePointsRepo(this.auth, this.firestore);
  Future<Either<Failure, void>> updatePoints({required int points}) async {
    try {
      await firestore
          .collection("users")
          .doc(auth.currentUser!.uid)
          .update({"points": FieldValue.increment(points)});
      return right(null);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebaseException(e));
      }
      log(e.toString());
      return left(ServerFailure(errMessage: "Something went wrong"));
    }
  }
}

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_dating_app/domain/auth/auth_failure.dart';

abstract class IAuthService {
  Stream<User?> get authStateChanges;
  Future<void> signOut();
  Stream<Either<AuthFailure, String>> signInWithPhoneNumber({
    required String phoneNumber,
    required Duration timeout,
  });
  Future<Either<AuthFailure, Unit>> verifySmsCode({
    required String smsCode,
    required String verificationId,
  });
  User? getCurrentUser();
}

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:social_dating_app/domain/auth/auth_user_model.dart';
part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final _authService = FirebaseAuth.instance;
  late StreamSubscription? _authUserSubscription;

  AuthCubit() : super(AuthState.empty()) {
    _authUserSubscription = _authService.authStateChanges().listen(_listenAuthStateChangesStream);
  }

  @override
  Future<void> close() async {
    await _authUserSubscription?.cancel();
    super.close();
  }

  Future<void> _listenAuthStateChangesStream(User? authUser) async {
    if (authUser == null) {
      emit(
        state.copyWith(
          userModel: AuthUserModel.empty(),
          isUserLoggedIn: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          userModel: AuthUserModel(id: authUser.uid, phoneNumber: authUser.phoneNumber!),
          isUserLoggedIn: true,
        ),
      );
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}

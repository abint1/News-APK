import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginfirebase/src/cubit1/auth/cubit/repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepo repo = AuthRepo();

  loginWithEmailPasswrd(String email, String password) async {
    emit(AuthLoading());

    try {
      UserCredential userCredential =
          await repo.loginWithEmailPasswrd(email, password);
      if (userCredential == null) {
        emit(AuthError());
        await Future.delayed(Duration(seconds: 2));
      } else {
        emit(AuthLoaded(userCredential));
      }
    } catch (ex) {
      emit(AuthError());
    }
  }

  registerWithEmailPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential =
          await repo.registrationWithEmailPassword(email, password);
      if (userCredential == null) {
        emit(AuthError());
        await Future.delayed(Duration(seconds: 2));
        emit(AuthInitial());
      } else {
        emit(AuthLoaded(userCredential));
      }
    } catch (ex) {
      emit(AuthError());
    }
  }
}

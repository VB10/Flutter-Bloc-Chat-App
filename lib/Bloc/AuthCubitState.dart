import 'package:bloc/bloc.dart';

import 'package:chatb/Services/IAuthServices.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthService authService;
  AuthCubit({required this.authService}) : super(AuthInital());

  Future<void> signUpAndEmit(String email, String pass, String name) async {
    try {
      emit(AuthIsLoading());
      final res = authService.signUp(email, pass, name);
      emit(AuthIsDone(cevap: res.toString()));
    } on FirebaseAuthException {
      emit(AuthError(err: "Error of Auth"));
    }
  }
}

abstract class AuthState {}

class AuthInital extends AuthState {}

class AuthIsLoading extends AuthState {
  AuthIsLoading();
}

class AuthIsDone extends AuthState {
  final String cevap;
  AuthIsDone({
    required this.cevap,
  });
}

class AuthError extends AuthState {
  final String err;
  AuthError({
    required this.err,
  });
}

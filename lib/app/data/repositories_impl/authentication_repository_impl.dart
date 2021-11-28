import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:movil181/app/domain/responses/sing_in_responses.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth _auth;
  User? _user;

  final Completer<void> _completer = Completer();

  AuthenticationRepositoryImpl(this._auth) {
    _init();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return user;
  }

  void _init() {
    _auth.authStateChanges().listen((User? user) {
      if (!_completer.isCompleted) {
        _completer.complete();
      }
      user = user;
    });
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }

  @override
  Future<SingInResponse> singInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user!;
      return SingInResponse(null, user);
    } on FirebaseAuthException catch (e) {
      return SingInResponse(stringToSingInError(e.code), null);
    }
  }
}

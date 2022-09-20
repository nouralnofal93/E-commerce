import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currenyUser;
  Future<void> logout();
  Stream<User?> authStateChanges();
  Future<User?> loginWithEmailAndPAssword(String email, String pass);
  Future<User?> signupWithEmailAndPAssword(String email, String pass);
}

class Auth implements AuthBase {
  final _firbaseAuth = FirebaseAuth.instance;
  @override
  Future<User?> loginWithEmailAndPAssword(String email, String pass) async {
    final user = await _firbaseAuth.signInWithEmailAndPassword(
        email: email, password: pass);
    return user.user;
  }

  Future<void> logout() async => await _firbaseAuth.signOut();

  @override
  Future<User?> signupWithEmailAndPAssword(String email, String pass) async {
    final user = await _firbaseAuth.createUserWithEmailAndPassword(
        email: email, password: pass);
    return user.user;
  }

  @override
  Stream<User?> authStateChanges() => _firbaseAuth.authStateChanges();

  @override
  User? get currenyUser => _firbaseAuth.currentUser;
}

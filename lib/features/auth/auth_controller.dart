import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isAuthenticated;
  const AuthState({this.isAuthenticated = false});
}

class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthState();
  }

  void login() {
    state = const AuthState(isAuthenticated: true);
  }

  void logout() {
    state = const AuthState(isAuthenticated: false);
  }
}

final authProvider = NotifierProvider<AuthController, AuthState>(() {
  return AuthController();
});

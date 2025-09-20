import 'package:fitflow_app/models/auth_state.dart';
import 'package:fitflow_app/models/utilisateur.dart';
import 'package:fitflow_app/notifier/auth_notifier.dart';
import 'package:fitflow_app/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  Utilisateur? _utilisateur;
  Utilisateur? get utilisateur => _utilisateur;

  Future<void> loginAvecGoogle() async {
    _utilisateur = await _authRepository.signInWithGoogle();
    notifyListeners();
  }

  final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(),
  );
}

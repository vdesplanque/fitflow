import 'package:fitflow_app/models/auth_state.dart';
import 'package:fitflow_app/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: mettre ça dans un auth_provider, mais la ça marche pas et ça me saoule
    final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
      (ref) => AuthNotifier(),
    );

    final auth = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Connexion - en cours')),
      body: Center(
        child: auth.isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: authNotifier.signInWithGoogle,
                child: const Text('Se connecter avec Google'),
              ),
      ),
    );
  }
}

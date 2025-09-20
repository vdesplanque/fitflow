import 'package:fitflow_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("HomeScreen build");
    final utilisateursAsync = ref.watch(utilisateursProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Utilisateurs')),
      body: utilisateursAsync.when(
        data: (utilisateurs) => ListView.builder(
          itemCount: utilisateurs.length,
          itemBuilder: (context, index) =>
              ListTile(title: Text(utilisateurs[index].name ?? '')),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final repo = ref.read(utilisateurRepositoryProvider);
          await repo.createUtilisateur("Nouvel utilisateur");
          ref.invalidate(utilisateursProvider); // Rafraîchir la liste
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}

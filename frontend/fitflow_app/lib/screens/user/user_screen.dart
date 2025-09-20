import 'package:fitflow_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utilisateursAsync = ref.watch(utilisateursProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: utilisateursAsync.when(
        data: (utilisateurs) => ListView.builder(
          itemCount: utilisateurs.length,
          itemBuilder: (context, index) {
            final user = utilisateurs[index];
            return ListTile(
              title: Text(user.name != null ? user.name! : 'Nom inconnu'),
              subtitle: Text(
                user.email != null ? user.email! : 'Email inconnu',
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

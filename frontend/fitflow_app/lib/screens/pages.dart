import 'package:fitflow_app/screens/form/exercice_form.dart';
import 'package:flutter/material.dart';

class AdminFormPage extends StatelessWidget {
  const AdminFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Ici ton formulaire admin"));
  }
}

class ProgramsListPage extends StatelessWidget {
  const ProgramsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Ici la liste des programmes"));
  }
}

class ExercisesListPage extends StatelessWidget {
  const ExercisesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Créer un exercice", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 12),
          ExerciseForm(
            onSubmit: (name, desc) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Exercice ajouté: $name")));
            },
          ),
          const SizedBox(height: 20),
          const Text("Liste des exercices à venir..."),
        ],
      ),
    );
  }
}

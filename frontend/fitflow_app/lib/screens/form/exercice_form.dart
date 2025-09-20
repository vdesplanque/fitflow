import 'package:flutter/material.dart';

class ExerciseForm extends StatefulWidget {
  final void Function(String name, String description) onSubmit;

  const ExerciseForm({super.key, required this.onSubmit});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Nom de l'exercice"),
            validator: (value) =>
                value == null || value.isEmpty ? "Champ obligatoire" : null,
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: "Description"),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onSubmit(
                  _nameController.text,
                  _descriptionController.text,
                );
              }
            },
            child: const Text("Ajouter exercice"),
          ),
        ],
      ),
    );
  }
}

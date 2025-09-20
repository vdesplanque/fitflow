import 'package:fitflow_app/models/exercice_bloc.dart';
import 'package:flutter/material.dart';

class ExerciceBlocFormData {
  final String exerciceId; // ID existant du catalogue
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController videoUrlController = TextEditingController();
  final TextEditingController repetitionsController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  ExerciceBloc toExerciceBloc() {
    return ExerciceBloc(
      id: '',
      exerciceId: '',
      exerciceName: nameController.text,
      exerciceDescription: descriptionController.text.isEmpty
          ? null
          : descriptionController.text,
      videoUrl: videoUrlController.text.isEmpty
          ? null
          : videoUrlController.text,
      repetitions: int.tryParse(repetitionsController.text),
      duration: durationController.text.isEmpty
          ? null
          : Duration(seconds: int.tryParse(durationController.text) ?? 0),
    );
  }

  ExerciceBlocFormData({required this.exerciceId});
}

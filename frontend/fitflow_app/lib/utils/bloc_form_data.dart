import 'package:fitflow_app/models/bloc.dart';
import 'package:flutter/material.dart';
import 'exercice_bloc_form_data.dart';
import 'bloc_variant_form_data.dart';

class BlocFormData {
  final TextEditingController titleController = TextEditingController();
  bool allowDifficultyAdjustment = false;
  List<ExerciceBlocFormData> exercices = [];
  List<BlocVariantFormData> variants = [];

  Bloc toBloc() {
    return Bloc(
      id: '',
      title: titleController.text,
      allowDifficultyAdjustment: allowDifficultyAdjustment,
      exercices: exercices.map((e) => e.toExerciceBloc()).toList(),
      variants: variants.map((v) => v.toBlocVariant()).toList(),
      sessionId: '',
    );
  }

  BlocFormData();
}

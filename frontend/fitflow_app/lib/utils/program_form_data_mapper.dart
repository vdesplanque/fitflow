import 'package:fitflow_app/utils/program_form_data.dart';

import '../models/program.dart';
import '../models/session.dart';
import '../models/bloc.dart';
import '../models/exercice_bloc.dart';
import '../models/bloc_variant.dart';

extension ProgramFormDataMapper on ProgramFormData {
  Program toProgramDto() {
    return Program(
      id: '', // laisser vide ou générer un GUID côté backend
      title: titleController.text,
      description: descriptionController.text,
      level: levelController.text,
      estimatedDuration: int.tryParse(estimatedDurationController.text) ?? 0,
      typeProgrammeId: typeProgrammeId, // à définir selon ton formulaire
      sessionCount: sessionsFormData.length,
      sessions: sessionsFormData.map((sessionForm) {
        return Session(
          id: '', // même logique que pour le programme
          title: sessionForm.titleController.text,
          blocs: sessionForm.blocs.map((blocForm) {
            return Bloc(
              id: '',
              title: blocForm.titleController.text,
              allowDifficultyAdjustment: blocForm.allowDifficultyAdjustment,
              sessionId: '', // sera rempli côté backend si nécessaire
              exercices: blocForm.exercices.map((exoForm) {
                return ExerciceBloc(
                  id: '',
                  exerciceId: exoForm.exerciceId,
                  exerciceName: exoForm.nameController.text,
                  exerciceDescription:
                      exoForm.descriptionController.text.isEmpty
                      ? null
                      : exoForm.descriptionController.text,
                  videoUrl: exoForm.videoUrlController.text.isEmpty
                      ? null
                      : exoForm.videoUrlController.text,
                  repetitions: int.tryParse(exoForm.repetitionsController.text),
                  duration: exoForm.durationController.text.isEmpty
                      ? null
                      : Duration(
                          seconds:
                              int.tryParse(exoForm.durationController.text) ??
                              0,
                        ),
                );
              }).toList(),
              variants: blocForm.variants.map((variantForm) {
                return BlocVariant(
                  id: '',
                  name: variantForm.nameController.text,
                  description: variantForm.descriptionController.text,
                );
              }).toList(),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'session_form_data.dart';

class ProgramFormData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController estimatedDurationController =
      TextEditingController();

  String typeProgrammeId = ''; // Dropdown ou autre
  List<SessionFormData> sessions = [];

  dynamic dispose() {
    titleController.dispose();
    descriptionController.dispose();
    levelController.dispose();
    estimatedDurationController.dispose();
    for (var s in sessions) {
      s.dispose();
    }
  }

  ProgramFormData();
}

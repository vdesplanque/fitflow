import 'package:flutter/material.dart';
import 'session_form_data.dart';

class ProgramFormData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController estimatedDurationController =
      TextEditingController();

  String typeProgrammeId = ''; // Dropdown ou autre
  List<SessionFormData> sessionsFormData = [];

  ProgramFormData();
}

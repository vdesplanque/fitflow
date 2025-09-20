import 'package:fitflow_app/models/session.dart';
import 'package:flutter/material.dart';
import 'bloc_form_data.dart';

class SessionFormData {
  final TextEditingController titleController = TextEditingController();
  List<BlocFormData> blocs = [];

  Session toSession() {
    return Session(
      id: '',
      title: titleController.text,
      blocs: blocs.map((b) => b.toBloc()).toList(),
    );
  }

  SessionFormData();
}

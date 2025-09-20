import 'package:fitflow_app/models/bloc_variant.dart';
import 'package:flutter/material.dart';

class BlocVariantFormData {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  BlocVariant toBlocVariant() {
    return BlocVariant(
      id: '',
      name: nameController.text,
      description: descriptionController.text,
    );
  }

  dynamic dispose() {
    nameController.dispose();
    descriptionController.dispose();
  }

  BlocVariantFormData();
}

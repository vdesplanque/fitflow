import 'package:fitflow_app/models/bloc.dart';
import 'package:fitflow_app/models/bloc_variant.dart';
import 'package:fitflow_app/models/exercice_bloc.dart';
import 'package:fitflow_app/models/program.dart';
import 'package:fitflow_app/models/session.dart';
import 'package:fitflow_app/providers/program_provider.dart';
import 'package:fitflow_app/utils/bloc_form_data.dart';
import 'package:fitflow_app/utils/bloc_variant_form_data.dart';
import 'package:fitflow_app/utils/exercice_bloc_form_data.dart';
import 'package:fitflow_app/utils/program_form_data.dart';
import 'package:fitflow_app/utils/program_form_data_mapper.dart';
import 'package:fitflow_app/utils/session_form_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminPage extends ConsumerStatefulWidget {
  const AdminPage({super.key});

  @override
  ConsumerState<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends ConsumerState<AdminPage> {
  // Programme

  final ProgramFormData _programFormData = ProgramFormData();

  @override
  void dispose() {
    _programFormData.dispose();
    super.dispose();
  }

  void _addSession() =>
      setState(() => _programFormData.sessions.add(SessionFormData()));

  void _removeSession(int index) {
    setState(() {
      _programFormData.sessions[index].dispose();
      _programFormData.sessions.removeAt(index);
    });
  }

  void _submit() async {
    final programDto = _programFormData.toProgramDto();
    try {
      final repo = ref.read(programRepositoryProvider);
      await repo.create(programDto);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Programme créé avec succès !')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la création : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin - Create Program')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgramFields(),
            const SizedBox(height: 20),
            const Text(
              'Sessions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ..._programFormData.sessions.asMap().entries.map(
              (entry) => _buildSessionCard(entry.key, entry.value),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addSession,
              child: const Text('Add Session'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit Program'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramFields() => Column(
    children: [
      TextField(
        controller: _programFormData.titleController,
        decoration: const InputDecoration(labelText: 'Title'),
      ),
      TextField(
        controller: _programFormData.descriptionController,
        decoration: const InputDecoration(labelText: 'Description'),
      ),
      TextField(
        controller: _programFormData.levelController,
        decoration: const InputDecoration(labelText: 'Level'),
      ),
      TextField(
        controller: _programFormData.estimatedDurationController,
        decoration: const InputDecoration(
          labelText: 'Estimated Duration (min)',
        ),
        keyboardType: TextInputType.number,
      ),
    ],
  );

  Widget _buildSessionCard(int index, SessionFormData session) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: session.titleController,
                    decoration: const InputDecoration(
                      labelText: 'Session Title',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _removeSession(index),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...session.blocs.asMap().entries.map(
              (entry) => _buildBlocCard(session, entry.key, entry.value),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => session.blocs.add(BlocFormData())),
              child: const Text('Add Bloc'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlocCard(SessionFormData session, int index, BlocFormData bloc) {
    return Card(
      color: Colors.grey[100],
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: bloc.titleController,
                    decoration: const InputDecoration(labelText: 'Bloc Title'),
                  ),
                ),
                Switch(
                  value: bloc.allowDifficultyAdjustment,
                  onChanged: (val) =>
                      setState(() => bloc.allowDifficultyAdjustment = val),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>
                      setState(() => session.blocs.removeAt(index)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Exercices'),
            ...bloc.exercices.asMap().entries.map(
              (entry) => _buildExerciceCard(bloc, entry.key, entry.value),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => bloc.exercices.add(ExerciceBlocFormData())),
              child: const Text('Add Exercice'),
            ),
            const SizedBox(height: 8),
            const Text('Variants'),
            ...bloc.variants.asMap().entries.map(
              (entry) => _buildVariantCard(bloc, entry.key, entry.value),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => bloc.variants.add(BlocVariantFormData())),
              child: const Text('Add Variant'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciceCard(
    BlocFormData bloc,
    int index,
    ExerciceBlocFormData exo,
  ) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: exo.nameController,
              decoration: const InputDecoration(labelText: 'Exercice Name'),
            ),
            TextField(
              controller: exo.descriptionController,
              decoration: const InputDecoration(
                labelText: 'Exercice Description',
              ),
            ),
            TextField(
              controller: exo.videoUrlController,
              decoration: const InputDecoration(labelText: 'Video URL'),
            ),
            TextField(
              controller: exo.repetitionsController,
              decoration: const InputDecoration(labelText: 'Repetitions'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: exo.durationController,
              decoration: const InputDecoration(
                labelText: 'Duration (seconds)',
              ),
              keyboardType: TextInputType.number,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => setState(() => bloc.exercices.removeAt(index)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantCard(
    BlocFormData bloc,
    int index,
    BlocVariantFormData variant,
  ) {
    return Card(
      color: Colors.grey[300],
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: variant.nameController,
                decoration: const InputDecoration(labelText: 'Variant Name'),
              ),
            ),
            Expanded(
              child: TextField(
                controller: variant.descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Variant Description',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => setState(() => bloc.variants.removeAt(index)),
            ),
          ],
        ),
      ),
    );
  }
}

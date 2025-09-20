import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/program_repository.dart';
import '../models/program.dart';

final programRepositoryProvider = Provider((ref) => ProgramRepository());

final programsProvider = FutureProvider<List<Program>>((ref) async {
  final repo = ref.read(programRepositoryProvider);
  return repo.getAll();
});

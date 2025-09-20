import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/utilisateur.dart';
import '../repositories/utilisateur_repository.dart';

final utilisateurRepositoryProvider = Provider(
  (ref) => UtilisateurRepository(),
);

final utilisateursProvider = FutureProvider<List<Utilisateur>>((ref) async {
  final repo = ref.read(utilisateurRepositoryProvider);
  return repo.getUtilisateurs();
});

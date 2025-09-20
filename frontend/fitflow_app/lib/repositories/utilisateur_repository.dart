import 'dart:convert';
import 'package:fitflow_app/repositories/repository_base.dart';
import 'package:http/http.dart' as http;
import '../models/utilisateur.dart';

class UtilisateurRepository extends RepositoryBase {
  UtilisateurRepository() : super('utilisateur');
  Future<List<Utilisateur>> getUtilisateurs() async {
    final response = await http.get(Uri.parse(fullUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Utilisateur.fromJson(e)).toList();
    } else {
      throw Exception('Erreur lors du chargement des utilisateurs');
    }
  }

  Future<void> createUtilisateur(String nom) async {
    final response = await http.post(
      Uri.parse(fullUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'nom': nom}),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Erreur lors de la création de l\'utilisateur');
    }
  }
}

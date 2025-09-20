import 'dart:convert';
import 'package:fitflow_app/repositories/repository_base.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/program.dart';

class ProgramRepository extends RepositoryBase {
  ProgramRepository() : super('program');
  final String baseUrl =
      "http://10.0.2.2:5201/api/program"; // 10.0.2.2 pour émulateur Android

  Future<List<Program>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Program.fromJson(e)).toList();
    } else {
      throw Exception("Erreur ${response.statusCode}");
    }
  }

  Future<Program> getById(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));
    if (response.statusCode == 200) {
      return Program.fromJson(json.decode(response.body));
    } else {
      throw Exception("Erreur ${response.statusCode}");
    }
  }

  Future<void> create(Program program) async {
    debugPrint("Programme repo, call : '$baseUrl'");
    debugPrint("Program  : '$program'");
    debugPrint("Program json : '${program.toJson()}'");
    debugPrint("Json encoded : '${jsonEncode(program.toJson())}'");
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(program.toJson()),
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception("Erreur lors de la création");
    }
  }

  Future<void> update(String id, Program program) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(program.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception("Erreur lors de la mise à jour");
    }
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Erreur lors de la suppression");
    }
  }
}

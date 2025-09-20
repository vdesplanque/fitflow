import 'dart:convert';

import 'package:fitflow_app/models/utilisateur.dart';
import 'package:fitflow_app/repositories/repository_base.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends RepositoryBase {
  AuthRepository() : super('auth');
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Utilisateur?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print('Connexion annulée par l’utilisateur');
        return null;
      }

      print('googleUser : ${googleUser}');

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;

      final response = await http.post(
        Uri.parse(fullUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"provider": "google", "token": idToken}),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Utilisateur.fromJson(json); // à créer
      } else {
        throw Exception('Erreur lors de la connexion');
      }
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'utilisateur.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Utilisateur {
  final String id;
  final String? name;
  final String? email;

  Utilisateur({required this.id, required this.name, required this.email});

  factory Utilisateur.fromJson(Map<String, dynamic> json) =>
      _$UtilisateurFromJson(json);

  Map<String, dynamic> toJson() => _$UtilisateurToJson(this);
}

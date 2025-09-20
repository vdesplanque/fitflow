import 'package:fitflow_app/utils/json_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloc_variant.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class BlocVariant {
  final String id;
  late final String name;
  late final String description;

  BlocVariant({this.id = '', required this.name, required this.description});

  factory BlocVariant.fromJson(Map<String, dynamic> json) =>
      _$BlocVariantFromJson(json);

  Map<String, dynamic> toJson() => cleanJson(_$BlocVariantToJson(this));

  BlocVariant copyWith({String? id, String? name, String? description}) {
    return BlocVariant(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

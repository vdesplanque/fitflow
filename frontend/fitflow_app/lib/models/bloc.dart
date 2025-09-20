import 'package:fitflow_app/utils/json_utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'exercice_bloc.dart';
import 'bloc_variant.dart';
part 'bloc.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Bloc {
  final String id;
  late final String title;
  late final bool allowDifficultyAdjustment;
  final List<ExerciceBloc> exercices;
  final List<BlocVariant> variants;
  final String sessionId;

  Bloc({
    this.id = '',
    required this.title,
    required this.allowDifficultyAdjustment,
    required this.exercices,
    required this.variants,
    this.sessionId = '',
  });

  factory Bloc.fromJson(Map<String, dynamic> json) => _$BlocFromJson(json);

  Map<String, dynamic> toJson() => cleanJson(_$BlocToJson(this));

  Bloc copyWith({
    String? id,
    String? title,
    bool? allowDifficultyAdjustment,
    List<ExerciceBloc>? exercices,
    List<BlocVariant>? variants,
    String? sessionId,
  }) {
    return Bloc(
      id: id ?? this.id,
      title: title ?? this.title,
      allowDifficultyAdjustment:
          allowDifficultyAdjustment ?? this.allowDifficultyAdjustment,
      exercices: exercices ?? List<ExerciceBloc>.from(this.exercices),
      variants: variants ?? List<BlocVariant>.from(this.variants),
      sessionId: sessionId ?? this.sessionId,
    );
  }
}

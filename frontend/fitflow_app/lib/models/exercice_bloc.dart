import 'package:fitflow_app/utils/json_utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exercice_bloc.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class ExerciceBloc {
  final String id;
  final String exerciceId;
  late final String exerciceName;
  late final String? exerciceDescription;
  late final String? videoUrl;
  late final int? repetitions;
  late final Duration? duration;

  ExerciceBloc({
    this.id = '',
    required this.exerciceId,
    required this.exerciceName,
    required this.exerciceDescription,
    this.videoUrl,
    required this.repetitions,
    required this.duration,
  });

  factory ExerciceBloc.fromJson(Map<String, dynamic> json) =>
      _$ExerciceBlocFromJson(json);

  Map<String, dynamic> toJson() => cleanJson(_$ExerciceBlocToJson(this));

  ExerciceBloc copyWith({
    String? id,
    String? exerciceId,
    String? exerciceName,
    String? exerciceDescription,
    String? videoUrl,
    int? repetitions,
    Duration? duration,
  }) {
    return ExerciceBloc(
      id: id ?? this.id,
      exerciceId: exerciceId ?? this.exerciceId,
      exerciceName: exerciceName ?? this.exerciceName,
      exerciceDescription: exerciceDescription ?? this.exerciceDescription,
      videoUrl: videoUrl ?? this.videoUrl,
      repetitions: repetitions ?? this.repetitions,
      duration: duration ?? this.duration,
    );
  }
}

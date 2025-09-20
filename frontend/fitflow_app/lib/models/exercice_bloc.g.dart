// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercice_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciceBloc _$ExerciceBlocFromJson(Map<String, dynamic> json) => ExerciceBloc(
  id: json['id'] as String? ?? '',
  exerciceId: json['exerciceId'] as String,
  exerciceName: json['exerciceName'] as String,
  exerciceDescription: json['exerciceDescription'] as String?,
  videoUrl: json['videoUrl'] as String?,
  repetitions: (json['repetitions'] as num?)?.toInt(),
  duration: json['duration'] == null
      ? null
      : Duration(microseconds: (json['duration'] as num).toInt()),
);

Map<String, dynamic> _$ExerciceBlocToJson(ExerciceBloc instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exerciceId': instance.exerciceId,
      'exerciceName': instance.exerciceName,
      'exerciceDescription': ?instance.exerciceDescription,
      'videoUrl': ?instance.videoUrl,
      'repetitions': ?instance.repetitions,
      'duration': ?instance.duration?.inMicroseconds,
    };

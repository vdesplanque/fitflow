// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bloc _$BlocFromJson(Map<String, dynamic> json) => Bloc(
  id: json['id'] as String? ?? '',
  title: json['title'] as String,
  allowDifficultyAdjustment: json['allowDifficultyAdjustment'] as bool,
  exercices: (json['exercices'] as List<dynamic>)
      .map((e) => ExerciceBloc.fromJson(e as Map<String, dynamic>))
      .toList(),
  variants: (json['variants'] as List<dynamic>)
      .map((e) => BlocVariant.fromJson(e as Map<String, dynamic>))
      .toList(),
  sessionId: json['sessionId'] as String? ?? '',
);

Map<String, dynamic> _$BlocToJson(Bloc instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'allowDifficultyAdjustment': instance.allowDifficultyAdjustment,
  'exercices': instance.exercices.map((e) => e.toJson()).toList(),
  'variants': instance.variants.map((e) => e.toJson()).toList(),
  'sessionId': instance.sessionId,
};

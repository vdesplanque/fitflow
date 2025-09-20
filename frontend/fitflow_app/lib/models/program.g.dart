// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
  id: json['id'] as String? ?? '',
  title: json['title'] as String,
  description: json['description'] as String,
  level: json['level'] as String,
  estimatedDuration: (json['estimatedDuration'] as num).toInt(),
  typeProgrammeId: json['typeProgrammeId'] as String,
  sessionCount: (json['sessionCount'] as num).toInt(),
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => Session.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'level': instance.level,
  'estimatedDuration': instance.estimatedDuration,
  'typeProgrammeId': instance.typeProgrammeId,
  'sessionCount': instance.sessionCount,
  'sessions': instance.sessions.map((e) => e.toJson()).toList(),
};

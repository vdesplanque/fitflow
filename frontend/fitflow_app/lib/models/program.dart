import 'package:json_annotation/json_annotation.dart';

import 'session.dart';
import '../utils/json_utils.dart';
part 'program.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Program {
  final String id;
  final String title;
  final String description;
  final String level;
  final int estimatedDuration;
  final String typeProgrammeId;
  final int sessionCount;
  final List<Session> sessions;

  Program({
    this.id = '',
    required this.title,
    required this.description,
    required this.level,
    required this.estimatedDuration,
    required this.typeProgrammeId,
    required this.sessionCount,
    required this.sessions,
  });

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);

  Map<String, dynamic> toJson() => cleanJson(_$ProgramToJson(this));

  Program copyWith({
    String? id,
    String? title,
    String? description,
    String? level,
    int? estimatedDuration,
    String? typeProgrammeId,
    int? sessionCount,
    List<Session>? sessions,
  }) {
    return Program(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      level: level ?? this.level,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      typeProgrammeId: typeProgrammeId ?? this.typeProgrammeId,
      sessionCount: sessionCount ?? this.sessionCount,
      sessions: sessions ?? List<Session>.from(this.sessions),
    );
  }
}

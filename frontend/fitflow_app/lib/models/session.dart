import 'package:fitflow_app/utils/json_utils.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bloc.dart';
part 'session.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Session {
  final String id;
  final String title;
  final List<Bloc> blocs;

  Session({this.id = '', required this.title, required this.blocs});

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => cleanJson(_$SessionToJson(this));

  Session copyWith({String? id, String? title, List<Bloc>? blocs}) {
    return Session(
      id: id ?? this.id,
      title: title ?? this.title,
      blocs: blocs ?? List<Bloc>.from(this.blocs),
    );
  }
}

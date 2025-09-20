// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
  id: json['id'] as String? ?? '',
  title: json['title'] as String,
  blocs: (json['blocs'] as List<dynamic>)
      .map((e) => Bloc.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'blocs': instance.blocs.map((e) => e.toJson()).toList(),
};

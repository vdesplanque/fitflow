// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlocVariant _$BlocVariantFromJson(Map<String, dynamic> json) => BlocVariant(
  id: json['id'] as String? ?? '',
  name: json['name'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$BlocVariantToJson(BlocVariant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

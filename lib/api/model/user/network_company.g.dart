// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkCompany _$NetworkCompanyFromJson(Map<String, dynamic> json) {
  return NetworkCompany(
    name: json['name'] as String,
    catchPhrase: json['catchPhrase'] as String,
    bs: json['bs'] as String,
  );
}

Map<String, dynamic> _$NetworkCompanyToJson(NetworkCompany instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };

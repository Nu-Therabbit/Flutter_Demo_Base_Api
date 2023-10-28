// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkUser _$NetworkUserFromJson(Map<String, dynamic> json) {
  return NetworkUser(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    address: NetworkAddress.fromJson(json['address'] as Map<String, dynamic>),
    phone: json['phone'] as String,
    website: json['website'] as String,
    company: json['company'] == null
        ? null
        : NetworkCompany.fromJson(json['company'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkUserToJson(NetworkUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address.toJson(),
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company?.toJson(),
    };

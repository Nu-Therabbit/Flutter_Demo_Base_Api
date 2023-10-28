// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkAddress _$NetworkAddressFromJson(Map<String, dynamic> json) {
  return NetworkAddress(
    street: json['street'] as String,
    suite: json['suite'] as String,
    city: json['city'] as String,
    zipcode: json['zipcode'] as String,
    geo: NetworkGeo.fromJson(json['geo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkAddressToJson(NetworkAddress instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };

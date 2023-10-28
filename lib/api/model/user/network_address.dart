import 'package:json_annotation/json_annotation.dart';

import 'network_geo.dart';

part 'network_address.g.dart';

@JsonSerializable()
class NetworkAddress {
  NetworkAddress({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  NetworkGeo geo;

  factory NetworkAddress.fromJson(Map<String, dynamic> json) =>
      _$NetworkAddressFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkAddressToJson(this);
}

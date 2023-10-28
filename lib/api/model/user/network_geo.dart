import 'package:json_annotation/json_annotation.dart';

part 'network_geo.g.dart';

@JsonSerializable()
class NetworkGeo {
  NetworkGeo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory NetworkGeo.fromJson(Map<String, dynamic> json) =>
      _$NetworkGeoFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkGeoToJson(this);
}

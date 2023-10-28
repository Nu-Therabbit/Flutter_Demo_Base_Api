import 'package:json_annotation/json_annotation.dart';

part 'network_company.g.dart';

@JsonSerializable()
class NetworkCompany {
  NetworkCompany({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  @JsonKey(name: "name")
  String name;
  String catchPhrase;
  String bs;

  factory NetworkCompany.fromJson(Map<String, dynamic> json) =>
      _$NetworkCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkCompanyToJson(this);
}

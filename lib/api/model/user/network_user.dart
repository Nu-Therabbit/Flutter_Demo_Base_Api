import 'package:json_annotation/json_annotation.dart';

import 'network_address.dart';
import 'network_company.dart';

part 'network_user.g.dart';

@JsonSerializable(explicitToJson: true)
class NetworkUser {
  NetworkUser({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    this.company,
  });

  int id;
  @JsonKey(name: "name")
  String name;
  String username;
  String email;
  NetworkAddress address;
  String phone;
  String website;
  NetworkCompany? company;

  factory NetworkUser.fromJson(Map<String, dynamic> json) =>
      _$NetworkUserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$NetworkUserToJson(this);
}

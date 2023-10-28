import 'package:base_api/api/model/base_response.dart';
import 'package:base_api/api/model/user/network_user.dart';

class UserResponse extends BaseResponse {
  NetworkUser? data;

  UserResponse(this.data);

  UserResponse.mapJson(Map<String, dynamic> json) {
    data = fromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return NetworkUser.fromJson(json['data'] as Map<String, dynamic>);
  }
}

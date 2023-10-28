import 'package:base_api/api/model/base_response.dart';
import 'package:base_api/api/model/user/network_user.dart';

class UsersResponse extends BaseResponse {
  List<NetworkUser>? data;

  UsersResponse(this.data);

  UsersResponse.mapResponse(Map<String, dynamic> json) {
    data = fromJson(json);
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return json["data"]
        .map((data) => NetworkUser.fromJson(data))
        .cast<NetworkUser>()
        .toList();
  }
}

import 'package:base_api/api/base_api_client.dart';
import 'package:base_api/api/model/user_response.dart';
import 'package:base_api/api/model/users_response.dart';
import 'package:base_api/model/user/mapper/network_user_to_user_mapper.dart';
import 'package:base_api/model/user/user.dart';

class UserApi extends BaseApiClient {
  final NetworkUserToUserMapper mapper = NetworkUserToUserMapper();

  Future<List<User>> getUsers() async {
    var response = await get(endpoint: 'users', token: "mock-token-11111");
    var users = UsersResponse.mapResponse(response.body!)
        .data
        ?.map((e) => mapper.map(e))
        .toList();
    return users != null ? users : List.empty();
  }

  Future<User> getUser(int id) async {
    var response = await get(endpoint: "users/$id", token: "mock-token-11111");
    final networkUser = UserResponse.mapJson(response.body!).data!;
    final user = mapper.map(networkUser);
    return user;
  }
}

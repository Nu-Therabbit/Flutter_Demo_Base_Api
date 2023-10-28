import 'package:base_api/api/model/user/network_user.dart';
import 'package:base_api/common/mapper.dart';
import 'package:base_api/model/user/user.dart';

import 'network_address_to_address_mapper.dart';

class NetworkUserToUserMapper extends Mapper<NetworkUser, User> {
  @override
  User map(NetworkUser from) {
    return User(
        id: from.id,
        name: from.name,
        username: from.username,
        email: from.email,
        address: NetworkAddressToAddressMapper().map(from.address),
        phone: from.phone,
        website: from.website);
  }
}

import 'package:base_api/api/model/user/network_address.dart';
import 'package:base_api/common/mapper.dart';
import 'package:base_api/model/user/user.dart';

import 'network_geo_to_geo_mapper.dart';

class NetworkAddressToAddressMapper extends Mapper<NetworkAddress, Address> {
  @override
  Address map(NetworkAddress from) {
    return Address(
      street: from.street,
      suite: from.suite,
      city: from.city,
      zipcode: from.zipcode,
      geo: NetworkGeoToGeoMapper().map(from.geo),
    );
  }
}

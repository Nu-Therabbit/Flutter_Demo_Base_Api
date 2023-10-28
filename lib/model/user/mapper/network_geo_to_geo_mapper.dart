import 'package:base_api/api/model/user/network_geo.dart';
import 'package:base_api/common/mapper.dart';
import 'package:base_api/model/user/user.dart';

class NetworkGeoToGeoMapper extends Mapper<NetworkGeo, Geo> {
  @override
  Geo map(NetworkGeo from) {
    return Geo(lat: from.lng, lng: from.lng);
  }
}

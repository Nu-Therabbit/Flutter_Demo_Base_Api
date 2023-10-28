import 'dart:convert';

import 'package:base_api/api/base_marvel_api_client.dart';
import 'package:crypto/crypto.dart';

class MarvelApi extends BaseMarvelApiClient {
  getCharacters() async {
    final response = await get(endpoint: "characters");
    print(response);
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}

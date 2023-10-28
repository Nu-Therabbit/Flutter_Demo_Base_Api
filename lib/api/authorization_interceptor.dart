import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class AuthorizationInterceptor extends Interceptor {
  // todo inject this
  final String _publicKey = "6e84eefa9809f44061fd479cee6e75c0";
  final String _privateKey = "da49d0d036f2b645e8c17e9caba963a784c201c5";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String hash = _generateMd5("$timestamp$_privateKey$_publicKey");
    options.queryParameters["apikey"] = _publicKey;
    options.queryParameters["ts"] = "$timestamp";
    options.queryParameters["hash"] = hash;
    return super.onRequest(options, handler);
  }

  String _generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}

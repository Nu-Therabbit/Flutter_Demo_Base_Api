abstract class BaseResponse {
  final String message = "Success";
  bool success = false;

  dynamic fromJson(Map<String, dynamic> json);
}

class ApiResponse {
  int statusCode = -1;
  Map<String, dynamic>? body;

  ApiResponse(int statusCode, Map<String, dynamic>? body) {
    this.statusCode = statusCode;
    this.body = body;
  }

  bool wasSuccessful() {
    return statusCode >= 200 && statusCode < 300;
  }
}

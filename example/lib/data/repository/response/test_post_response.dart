import 'dart:convert';

import 'package:dio_http_client/network/api_response.dart';

class TestPostResponse extends ApiResponse<Map<String, dynamic>> {
  TestPostResponse._(
      {Map<String, dynamic>? body, String? message, String? result})
      : super(body: body, message: message, result: result);

  factory TestPostResponse.fromMap(Map<String, dynamic> data) {
    return TestPostResponse._(body: jsonDecode(data["data"]));
  }
}

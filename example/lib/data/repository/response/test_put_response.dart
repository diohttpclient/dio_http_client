import 'dart:convert';

import 'package:dio_http_client/network/api_response.dart';

class TestPutResponse extends ApiResponse<Map<String, dynamic>> {
  TestPutResponse._(
      {Map<String, dynamic>? body, String? message, String? result})
      : super(body: body, message: message, result: result);

  factory TestPutResponse.fromMap(Map<String, dynamic> data) {
    return TestPutResponse._(body: jsonDecode(data["data"]));
  }
}

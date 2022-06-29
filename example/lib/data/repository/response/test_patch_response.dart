import 'dart:convert';

import 'package:dio_http_client/network/api_response.dart';

class TestPatchResponse extends ApiResponse<Map<String, dynamic>> {
  TestPatchResponse._(
      {Map<String, dynamic>? body, String? message, String? result})
      : super(body: body, message: message, result: result);

  factory TestPatchResponse.fromMap(Map<String, dynamic> data) {
    return TestPatchResponse._(body: jsonDecode(data["data"]));
  }
}

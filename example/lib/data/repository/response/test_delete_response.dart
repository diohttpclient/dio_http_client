import 'dart:convert';

import 'package:dio_http_client/network/api_response.dart';

class TestDeleteResponse extends ApiResponse<Map<String, dynamic>> {
  TestDeleteResponse._(
      {Map<String, dynamic>? body, String? message, String? result})
      : super(body: body, message: message, result: result);

  factory TestDeleteResponse.fromMap(Map<String, dynamic> data) {
    return TestDeleteResponse._(body: jsonDecode(data["data"]));
  }
}

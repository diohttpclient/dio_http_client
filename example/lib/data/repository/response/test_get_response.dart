import 'package:dio_http_client/network/api_response.dart';

class TestGetResponse extends ApiResponse<Map<String, dynamic>> {
  TestGetResponse._(
      {Map<String, dynamic>? body, String? message, String? result})
      : super(body: body, message: message, result: result);

  factory TestGetResponse.fromMap(Map<String, dynamic> data) {
    return TestGetResponse._(body: data["args"]);
  }
}

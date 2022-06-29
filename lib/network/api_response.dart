part 'api_error.dart';

class ApiResponse<T> {
  late T? body;
  late String? result;
  late String? message;

  ApiResponse({
    this.body,
    this.result,
    this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        body: json['body'], result: json['result'], message: json['message']);
  }
}

part of 'api_response.dart';

class ApiError {
  late int? code;
  late String? message;

  ApiError._({
    this.code,
    this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError._(
      code: json['code'],
      message: json['message'],
    );
  }
}

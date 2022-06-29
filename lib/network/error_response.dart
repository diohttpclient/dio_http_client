import 'base_response.dart';

class ErrorResponse extends BaseResponse {
  final String errorMessage;
  final String errorCode;

  ErrorResponse(int statusCode, this.errorMessage, this.errorCode)
      : super(statusCode);
}

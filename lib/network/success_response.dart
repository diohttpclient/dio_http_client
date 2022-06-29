import 'base_response.dart';

class SuccessResponse<T> extends BaseResponse {
  final T data;

  SuccessResponse(int? statusCode, this.data) : super(statusCode);
}

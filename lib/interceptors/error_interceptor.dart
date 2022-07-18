import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response!.statusCode != 503) {}

    handler.next(err);
  }
}

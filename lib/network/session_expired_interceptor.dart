import 'package:dio/dio.dart';

class SessionExpiredInterceptor extends Interceptor {
  SessionExpiredInterceptor();
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }
}

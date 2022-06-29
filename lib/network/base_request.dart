import 'package:dio/dio.dart';

import '../costants.dart';
import 'rest_method.dart';

abstract class BaseRequest {
  final String baseUrl;

  final String endPoint;

  final RestMethod method;

  final dynamic Function(dynamic)? decoder;

  Map<String, String> header;

  Map<String, String> get headers => header;

  Map<String, dynamic> get body => {};

  Map<String, dynamic> get queryParameters => {};

  ResponseType get responseType => ResponseType.json;

  String get completeUrl => '$baseUrl/$endPoint';

  int get receiveTimeout => HttpConstants.requestReceiveTimeout;

  int get sendTimeout => HttpConstants.requestSendTimeout;

  BaseRequest({
    required this.baseUrl,
    required this.endPoint,
    required this.method,
    required this.header,
    this.decoder,
  });
}

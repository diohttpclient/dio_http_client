import 'package:dio/dio.dart';

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

  FormData? get formData => null;

  ResponseType get responseType => ResponseType.json;

  String get completeUrl => '$baseUrl/$endPoint';

  int? get receiveTimeout => null;

  int? get sendTimeout => null;

  BaseRequest({
    required this.baseUrl,
    required this.endPoint,
    required this.method,
    required this.header,
    this.decoder,
  });
}

import 'package:dio/dio.dart';

import 'base_request.dart';
import 'rest_method.dart';

abstract class ApiRequest extends BaseRequest {
  final String? token;
  final String? userEmail;

  ApiRequest({
    this.token,
    this.userEmail,
    required String baseUrl,
    required String endPoint,
    required RestMethod method,
    dynamic Function(dynamic)? decoder,
  }) : super(
          header: {
            Headers.contentTypeHeader: Headers.jsonContentType,
            Headers.acceptHeader: Headers.jsonContentType,
          },
          baseUrl: baseUrl,
          endPoint: endPoint,
          method: method,
          decoder: decoder,
        );

  @override
  Map<String, dynamic> get body => method != RestMethod.get
      ? {
          'token': token,
          'accountMail': userEmail,
          'userEmail': userEmail,
        }
      : {};
}

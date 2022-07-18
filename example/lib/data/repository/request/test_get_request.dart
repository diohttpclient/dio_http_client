import 'package:dio_http_client/network/api_request.dart';
import 'package:dio_http_client/network/rest_method.dart';
import 'package:dio_http_client_example/costants.dart';
import 'package:dio/dio.dart';

import '../response/test_get_response.dart';

class TestGetRequest extends ApiRequest {
  TestGetRequest()
      : super(
            baseUrl: Constants.domain,
            endPoint: "${Constants.getEndpoint}?key=value",
            method: RestMethod.get,
            decoder: (data) =>
                TestGetResponse.fromMap(Map<String, dynamic>.from(data)));

  @override
  // TODO: implement body
  Map<String, dynamic> get body => super.body;

  @override
  // TODO: implement queryParameters
  Map<String, dynamic> get queryParameters => super.queryParameters;

  @override
  // TODO: implement responseType
  ResponseType get responseType => super.responseType;

  @override
  // TODO: implement receiveTimeout
  int? get receiveTimeout => super.receiveTimeout;

  @override
  // TODO: implement sendTimeout
  int? get sendTimeout => super.sendTimeout;
}

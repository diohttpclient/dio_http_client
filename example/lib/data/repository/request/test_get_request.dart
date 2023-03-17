import 'package:dio_http_client/network/api_request.dart';
import 'package:dio_http_client/network/rest_method.dart';
import 'package:dio_http_client_example/costants.dart';

import '../response/test_get_response.dart';

class TestGetRequest extends ApiRequest {
  TestGetRequest()
      : super(
            baseUrl: Constants.domain,
            endPoint: Constants.getEndpoint,
            method: RestMethod.get,
            decoder: (data) =>
                TestGetResponse.fromMap(Map<String, dynamic>.from(data)));

  @override
  Map<String, dynamic> get queryParameters => {"key": "value"};
}

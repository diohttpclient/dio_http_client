import 'package:dio_http_client/network/api_request.dart';
import 'package:dio_http_client/network/rest_method.dart';
import 'package:dio_http_client_example/costants.dart';
import 'package:dio_http_client_example/data/repository/response/test_put_response.dart';

class TestPutRequest extends ApiRequest {
  TestPutRequest()
      : super(
            baseUrl: Constants.domain,
            endPoint: Constants.putEndpoint,
            method: RestMethod.put,
            decoder: (data) =>
                TestPutResponse.fromMap(Map<String, dynamic>.from(data)));

  @override
  Map<String, dynamic> get body => {"key": "value"};
}

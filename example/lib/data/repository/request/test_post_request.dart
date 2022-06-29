import 'package:dio_http_client/network/api_request.dart';
import 'package:dio_http_client/network/rest_method.dart';
import 'package:dio_http_client_example/costants.dart';
import 'package:dio_http_client_example/data/repository/response/test_post_response.dart';

class TestPostRequest extends ApiRequest {
  TestPostRequest()
      : super(
            baseUrl: Constants.domain,
            endPoint: Constants.postEndpoint,
            method: RestMethod.post,
            decoder: (data) =>
                TestPostResponse.fromMap(Map<String, dynamic>.from(data)));

  @override
  Map<String, dynamic> get body => {"key": "value"};
}

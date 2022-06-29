import 'package:dio_http_client/network/api_request.dart';
import 'package:dio_http_client/network/rest_method.dart';
import 'package:dio_http_client_example/costants.dart';

import '../response/test_delete_response.dart';

class TestDeleteRequest extends ApiRequest {
  TestDeleteRequest()
      : super(
            baseUrl: Constants.domain,
            endPoint: Constants.deleteEndpoint,
            method: RestMethod.delete,
            decoder: (data) =>
                TestDeleteResponse.fromMap(Map<String, dynamic>.from(data)));

  @override
  Map<String, dynamic> get body => {"key": "value"};
}

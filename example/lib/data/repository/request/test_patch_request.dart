import 'package:dio_http_client/network/api_request.dart';
import 'package:dio_http_client/network/rest_method.dart';
import 'package:dio_http_client_example/costants.dart';
import 'package:dio_http_client_example/data/repository/response/test_patch_response.dart';

class TestPatchRequest extends ApiRequest {
  TestPatchRequest()
      : super(
            baseUrl: Constants.domain,
            endPoint: Constants.patchEndpoint,
            method: RestMethod.patch,
            decoder: (data) =>
                TestPatchResponse.fromMap(Map<String, dynamic>.from(data)));

  @override
  Map<String, dynamic> get body => {"key": "value"};
}

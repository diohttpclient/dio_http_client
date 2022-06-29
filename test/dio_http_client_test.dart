import 'package:flutter_test/flutter_test.dart';
import 'package:dio_http_client/dio_http_client.dart';
import 'package:dio_http_client/dio_http_client_platform_interface.dart';
import 'package:dio_http_client/dio_http_client_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDioHttpClientPlatform 
    with MockPlatformInterfaceMixin
    implements DioHttpClientPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DioHttpClientPlatform initialPlatform = DioHttpClientPlatform.instance;

  test('$MethodChannelDioHttpClient is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDioHttpClient>());
  });

  test('getPlatformVersion', () async {
    DioHttpClient dioHttpClientPlugin = DioHttpClient();
    MockDioHttpClientPlatform fakePlatform = MockDioHttpClientPlatform();
    DioHttpClientPlatform.instance = fakePlatform;
  
    expect(await dioHttpClientPlugin.getPlatformVersion(), '42');
  });
}

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio_http_client/dio_http_client_method_channel.dart';

void main() {
  MethodChannelDioHttpClient platform = MethodChannelDioHttpClient();
  const MethodChannel channel = MethodChannel('dio_http_client');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}

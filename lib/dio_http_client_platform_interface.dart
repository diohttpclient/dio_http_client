import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dio_http_client_method_channel.dart';

abstract class DioHttpClientPlatform extends PlatformInterface {
  /// Constructs a DioHttpClientPlatform.
  DioHttpClientPlatform() : super(token: _token);

  static final Object _token = Object();

  static DioHttpClientPlatform _instance = MethodChannelDioHttpClient();

  /// The default instance of [DioHttpClientPlatform] to use.
  ///
  /// Defaults to [MethodChannelDioHttpClient].
  static DioHttpClientPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DioHttpClientPlatform] when
  /// they register themselves.
  static set instance(DioHttpClientPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

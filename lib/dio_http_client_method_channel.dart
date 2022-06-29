import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dio_http_client_platform_interface.dart';

/// An implementation of [DioHttpClientPlatform] that uses method channels.
class MethodChannelDioHttpClient extends DioHttpClientPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dio_http_client');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}


import 'dio_http_client_platform_interface.dart';

class DioHttpClient {
  Future<String?> getPlatformVersion() {
    return DioHttpClientPlatform.instance.getPlatformVersion();
  }
}

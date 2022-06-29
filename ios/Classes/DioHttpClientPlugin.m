#import "DioHttpClientPlugin.h"
#if __has_include(<dio_http_client/dio_http_client-Swift.h>)
#import <dio_http_client/dio_http_client-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dio_http_client-Swift.h"
#endif

@implementation DioHttpClientPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDioHttpClientPlugin registerWithRegistrar:registrar];
}
@end

//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <dio_http_client/dio_http_client_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) dio_http_client_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DioHttpClientPlugin");
  dio_http_client_plugin_register_with_registrar(dio_http_client_registrar);
}

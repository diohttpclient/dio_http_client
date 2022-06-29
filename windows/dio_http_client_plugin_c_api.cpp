#include "include/dio_http_client/dio_http_client_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "dio_http_client_plugin.h"

void DioHttpClientPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  dio_http_client::DioHttpClientPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

#include "cursor_manager_plugin.h"

#include <windows.h>
#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>
#include <memory>
#include <sstream>

namespace {

class CursorManagerPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  CursorManagerPlugin(flutter::PluginRegistrarWindows *registrar);

  virtual ~CursorManagerPlugin();

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);

  // The registrar for this plugin.
  flutter::PluginRegistrarWindows *registrar_;
};

// static
void CursorManagerPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "simple_live/cursor",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<CursorManagerPlugin>(registrar);

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

CursorManagerPlugin::CursorManagerPlugin(flutter::PluginRegistrarWindows *registrar)
    : registrar_(registrar) {}

CursorManagerPlugin::~CursorManagerPlugin() {}

void CursorManagerPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("hideCursor") == 0) {
    // Ocultar el cursor del sistema
    ShowCursor(FALSE);
    result->Success();
  } else if (method_call.method_name().compare("showCursor") == 0) {
    // Mostrar el cursor del sistema
    ShowCursor(TRUE);
    result->Success();
  } else {
    result->NotImplemented();
  }
}

}  // namespace

void CursorManagerPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  CursorManagerPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
} 
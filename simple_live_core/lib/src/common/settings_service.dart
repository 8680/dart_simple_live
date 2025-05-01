/// This is a service that provides access to application settings
/// It uses a callback-based approach to avoid direct dependencies on app-specific implementations
class SettingsService {
  static final SettingsService _instance = SettingsService._internal();
  
  factory SettingsService() {
    return _instance;
  }
  
  SettingsService._internal();

  String? Function()? _getHuyaCdnCallback;

  /// Register a callback to get the Huya CDN setting
  void registerHuyaCdnCallback(String? Function() callback) {
    _getHuyaCdnCallback = callback;
  }

  /// Get the currently selected Huya CDN
  String? getHuyaCdn() {
    if (_getHuyaCdnCallback != null) {
      return _getHuyaCdnCallback!();
    }
    return null;
  }
} 
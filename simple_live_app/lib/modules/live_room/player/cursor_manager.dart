import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Clase para gestionar el cursor del ratón en entornos de escritorio
class CursorManager {
  static const MethodChannel _channel = MethodChannel('simple_live/cursor');
  
  /// Oculta el cursor del ratón (solo en plataformas de escritorio)
  static Future<void> hideCursor() async {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      try {
        await _channel.invokeMethod('hideCursor');
      } catch (e) {
        debugPrint('Error al ocultar el cursor: $e');
      }
    }
  }
  
  /// Muestra el cursor del ratón (solo en plataformas de escritorio)
  static Future<void> showCursor() async {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      try {
        await _channel.invokeMethod('showCursor');
      } catch (e) {
        debugPrint('Error al mostrar el cursor: $e');
      }
    }
  }
} 
import 'package:flutter/services.dart';

class OSInfoChannel {
  static const MethodChannel _channel = MethodChannel('com.example.os/info');

  Future<String> getOSVersion() async {
    try {
      final version = await _channel.invokeMethod<String>('getOSVersion');
      return version ?? 'Unknown';
    } catch (e) {
      return 'Error';
    }
  }
}

import 'package:flutter/services.dart';

abstract class IVibrationService {
  Future<void> vibrate(int amplitude);
}

class VibrationService implements IVibrationService {
  final MethodChannel _methodChannel;

  VibrationService({required MethodChannel methodChannel})
    : _methodChannel = methodChannel;

  @override
  Future<void> vibrate(int amplitude) async {
    try {
      await _methodChannel.invokeMethod('vibrate', {
        'amplitude': amplitude,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

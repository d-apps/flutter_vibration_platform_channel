import 'package:flutter/services.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';

abstract class IVibrationService {
  Future<void> vibrate(VibrationEntity vibration);
}

class VibrationService implements IVibrationService {
  final MethodChannel _methodChannel;

  VibrationService({required MethodChannel methodChannel})
    : _methodChannel = methodChannel;

  @override
  Future<void> vibrate(VibrationEntity vibration) async {
    try {
      await _methodChannel.invokeMethod('vibrate', {
        'duration': vibration.duration,
        'strength': vibration.strength,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

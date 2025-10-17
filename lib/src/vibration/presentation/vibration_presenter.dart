import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';

abstract class VibrationPresenter {
  Stream<VibrationEntity> get vibrationStream;
  void updateDuration(int value);
  void updateAmplitude(int value);
  Future<void> vibrate();
}
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';

abstract class HomePresenter {
  VibrationEntity get vibrationEntity;
  void setDuration(int value);
  void setAmplitude(int value);
  Future<void> vibrate();
}
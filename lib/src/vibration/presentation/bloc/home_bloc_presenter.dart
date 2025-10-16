import 'package:flutter_vibration_platform_channel/src/vibration/presentation/home_presenter.dart';

import '../../domain/entities/vibration_entity.dart';

class HomeBlocPresenter implements HomePresenter {

  @override
  VibrationEntity get vibrationEntity => throw UnimplementedError();

  @override
  void setAmplitude(int value) {

  }

  @override
  void setDuration(int value) {

  }

  @override
  Future<void> vibrate() async {

  }

}
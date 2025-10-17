import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/vibration_presenter.dart';

import '../../domain/entities/vibration_entity.dart';

class VibrationBlocPresenter implements VibrationPresenter {

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
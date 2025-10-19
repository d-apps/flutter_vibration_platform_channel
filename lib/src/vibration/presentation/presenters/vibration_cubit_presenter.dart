import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/vibration_presenter.dart';

class VibrationCubitPresenter extends Cubit<int>
    implements VibrationPresenter {
  final ITriggerVibrationUseCase _triggerVibrationUseCase;

  VibrationCubitPresenter({
    required ITriggerVibrationUseCase triggerVibrationUseCase,
  }) :_triggerVibrationUseCase = triggerVibrationUseCase,
    super(0);

  @override
  Stream<int> get amplitudeStream => stream;

  @override
  void updateAmplitude(int value) {
    emit(value);
    vibrate();
  }

  @override
  Future<void> vibrate() async {
    final either = await _triggerVibrationUseCase(state);
    either.fold(
      (l){
        var exception = l;
        print(exception.toString());
      },
      (r){},
    );
  }

}
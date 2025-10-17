import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/vibration_presenter.dart';

class VibrationCubitPresenter extends Cubit<VibrationEntity> implements VibrationPresenter {
  final ITriggerVibrationUseCase _triggerVibrationUseCase;

  VibrationCubitPresenter({
    required ITriggerVibrationUseCase triggerVibrationUseCase,
}) :
    _triggerVibrationUseCase = triggerVibrationUseCase,
        super(const VibrationEntity(duration: 0, amplitude: 0));


  @override
  VibrationEntity get vibrationEntity => state;

  @override
  void setAmplitude(int value) {
    emit(state.copyWith(amplitude: value));
  }

  @override
  void setDuration(int value) {
    emit(state.copyWith(duration: value));
  }

  @override
  Future<void> vibrate() async {
    final either = await _triggerVibrationUseCase(state);
    either.fold(
      (l){},
      (r){},
    );
  }

}
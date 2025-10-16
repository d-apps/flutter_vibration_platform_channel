import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/home_presenter.dart';

class HomeCubitPresenter extends Cubit<VibrationEntity> implements HomePresenter {
  final ITriggerVibrationUseCase _triggerVibrationUseCase;

  HomeCubitPresenter({
    required ITriggerVibrationUseCase triggerVibrationUseCase,
}) :
    _triggerVibrationUseCase = triggerVibrationUseCase,
        super(const VibrationEntity(duration: 5000, amplitude: 128));


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
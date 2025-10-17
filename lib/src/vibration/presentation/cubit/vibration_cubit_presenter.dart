import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/vibration_presenter.dart';

class VibrationCubitPresenter extends Cubit<VibrationEntity>
    implements VibrationPresenter {
  final ITriggerVibrationUseCase _triggerVibrationUseCase;

  VibrationCubitPresenter({
    required ITriggerVibrationUseCase triggerVibrationUseCase,
  }) :_triggerVibrationUseCase = triggerVibrationUseCase,
    super(const VibrationEntity(duration: 0, amplitude: 0));

  @override
  Stream<VibrationEntity> get vibrationStream => stream;

  @override
  void updateAmplitude(int value) {
    emit(state.copyWith(amplitude: value));
    vibrate();
  }

  @override
  void updateDuration(int value) {
    emit(state.copyWith(duration: value));
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
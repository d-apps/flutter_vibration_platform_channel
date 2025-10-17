import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/bloc/vibration_event.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/bloc/vibration_state.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/vibration_presenter.dart';
import '../../domain/entities/vibration_entity.dart';
import '../../domain/usecases/trigger_vibration_usecase.dart';

class VibrationBlocPresenter extends Bloc<VibrationEvent, VibrationState>
    implements VibrationPresenter {
  final ITriggerVibrationUseCase _triggerVibrationUseCase;

  VibrationBlocPresenter(super.initialState, {
    required ITriggerVibrationUseCase triggerVibrationUseCase,
  }) : _triggerVibrationUseCase = triggerVibrationUseCase

  {
    on<UpdateDurationEvent>((event, emit) {
      final updatedEntity = state.vibrationEntity
          .copyWith(duration: event.duration);
      emit(VibrationState(updatedEntity));
      vibrate();
    });

    on<UpdateAmplitudeEvent>((event, emit) {
      final updatedEntity = state.vibrationEntity
          .copyWith(amplitude: event.amplitude);
      emit(VibrationState(updatedEntity));
      vibrate();
    });
  }


  @override
  Future<void> vibrate() async {
    final either = await _triggerVibrationUseCase(state.vibrationEntity);
    either.fold(
          (l) {
        var exception = l;
        print(exception.toString());
      },
          (r) {},
    );
  }

  @override
  void updateAmplitude(int value) {
    add(UpdateAmplitudeEvent(value));
  }

  @override
  void updateDuration(int value) {
    add(UpdateDurationEvent(value));
  }

  @override
  Stream<VibrationEntity> get vibrationStream => stream.map((state) => state.vibrationEntity);

}
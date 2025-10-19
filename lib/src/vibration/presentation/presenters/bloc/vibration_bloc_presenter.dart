import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/presenters/bloc/vibration_event.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/presenters/bloc/vibration_state.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/vibration_presenter.dart';

class VibrationBlocPresenter extends Bloc<VibrationEvent, VibrationState>
    implements VibrationPresenter {
  final ITriggerVibrationUseCase _triggerVibrationUseCase;

  VibrationBlocPresenter(super.initialState, {
    required ITriggerVibrationUseCase triggerVibrationUseCase,
  }) : _triggerVibrationUseCase = triggerVibrationUseCase

  {
    on<UpdateAmplitudeEvent>((event, emit) {
      emit(VibrationState(event.amplitude));
      vibrate();
    });
  }

  @override
  Stream<int> get amplitudeStream => stream.map((state) => state.amplitude);

  @override
  Future<void> vibrate() async {
    final either = await _triggerVibrationUseCase(state.amplitude);
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


}
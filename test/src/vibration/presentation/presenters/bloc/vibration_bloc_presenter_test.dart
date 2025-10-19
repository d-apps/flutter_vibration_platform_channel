
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/presenters/bloc/vibration_bloc_presenter.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/presenters/bloc/vibration_state.dart';
import 'package:mocktail/mocktail.dart';
import '../../../vibration_mocks.dart';

void main(){
  late VibrationBlocPresenter sut;
  late VibrationState initialState;
  late MockTriggerVibrationUseCase mockTriggerVibrationUseCase;

  setUp((){
    mockTriggerVibrationUseCase = MockTriggerVibrationUseCase();
    initialState = VibrationState(0);
    sut = VibrationBlocPresenter(initialState, triggerVibrationUseCase: mockTriggerVibrationUseCase);
  });

  void mockVibrateMethod() {
    when(() => mockTriggerVibrationUseCase.call(any()))
        .thenAnswer((_) async => Right(null));
  }

  test('Initial state should be amplitude 0', (){
    expect(sut.state.amplitude, 0);
  });

  test('setAmplitude should update the amplitude in state', () async {
    mockVibrateMethod();
    sut.updateAmplitude(255);
    await Future.delayed(Duration.zero);
    expect(sut.state.amplitude, 255);
  });

  test('vibrate should call triggerVibrationUseCase when event is added',
        () async {
    mockVibrateMethod();
    sut.updateAmplitude(255);
    await Future.delayed(Duration.zero);
    verify(() => mockTriggerVibrationUseCase.call(any())).called(1);
  });
}
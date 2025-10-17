
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/bloc/vibration_bloc_presenter.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/bloc/vibration_state.dart';
import 'package:mocktail/mocktail.dart';
import '../../vibration_mocks.dart';

void main(){
  late VibrationBlocPresenter sut;
  late VibrationState initialState;
  late VibrationEntity vibrationEntity;
  late MockTriggerVibrationUseCase mockTriggerVibrationUseCase;

  setUp((){
    mockTriggerVibrationUseCase = MockTriggerVibrationUseCase();
    vibrationEntity = VibrationEntity(amplitude: 0, duration: 0);
    initialState = VibrationState(vibrationEntity);
    sut = VibrationBlocPresenter(initialState, triggerVibrationUseCase: mockTriggerVibrationUseCase);
  });

  setUpAll(() {
    registerFallbackValue(VibrationEntity(amplitude: 0, duration: 0));
  });

  void mockVibrateMethod() {
    when(() => mockTriggerVibrationUseCase.call(any()))
        .thenAnswer((_) async => Right(null));
  }

  test('Initial state should be VibrationEntity with duration 0 and amplitude 0', (){
    expect(sut.state.vibrationEntity.duration, 0);
    expect(sut.state.vibrationEntity.amplitude, 0);
  });

  test('setDuration should update the duration in state', () async {
    mockVibrateMethod();
    sut.updateDuration(3000);
    await Future.delayed(Duration.zero);
    expect(sut.state.vibrationEntity.duration, 3000);
  });

  test('setAmplitude should update the amplitude in state', () async {
    mockVibrateMethod();
    sut.updateAmplitude(255);
    await Future.delayed(Duration.zero);
    expect(sut.state.vibrationEntity.amplitude, 255);
  });

  test('vibrate should call triggerVibrationUseCase when event is added',
        () async {
    mockVibrateMethod();
    sut.updateDuration(3000);
    sut.updateAmplitude(255);
    await Future.delayed(Duration.zero);
    verify(() => mockTriggerVibrationUseCase.call(any())).called(2);
  });
}
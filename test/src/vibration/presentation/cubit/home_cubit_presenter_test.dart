import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/cubit/home_cubit_presenter.dart';
import 'package:mocktail/mocktail.dart';

class MockTriggerVibrationUseCase extends Mock implements ITriggerVibrationUseCase {}

void main(){
  late HomeCubitPresenter sut;
  late MockTriggerVibrationUseCase mockTriggerVibrationUseCase;

  setUp((){
    mockTriggerVibrationUseCase = MockTriggerVibrationUseCase();
    sut = HomeCubitPresenter(triggerVibrationUseCase: mockTriggerVibrationUseCase);
  });

  setUpAll(() {
    registerFallbackValue(VibrationEntity(duration: 0, amplitude: 0));
  });

  test('Initial state should be VibrationEntity with duration 5000 and amplitude 128', (){
    expect(sut.state.duration, 5000);
    expect(sut.state.amplitude, 128);
  });

  test('setDuration should update the duration in state', (){
    sut.setDuration(3000);
    expect(sut.state.duration, 3000);
  });

  test('setAmplitude should update the amplitude in state', (){
    sut.setAmplitude(200);
    expect(sut.state.amplitude, 200);
  });

  test('vibrate should call triggerVibrationUseCase with current state', () async {
    when(() => mockTriggerVibrationUseCase.call(any())).thenAnswer((_) async => Right(null));

    await sut.vibrate();

    verify(() => mockTriggerVibrationUseCase.call(sut.state)).called(1);
  });

}
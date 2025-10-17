import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/cubit/vibration_cubit_presenter.dart';
import 'package:mocktail/mocktail.dart';

class MockTriggerVibrationUseCase extends Mock implements ITriggerVibrationUseCase {}

void main(){
  late VibrationCubitPresenter sut;
  late MockTriggerVibrationUseCase mockTriggerVibrationUseCase;

  setUp((){
    mockTriggerVibrationUseCase = MockTriggerVibrationUseCase();
    sut = VibrationCubitPresenter(triggerVibrationUseCase: mockTriggerVibrationUseCase);
  });

  setUpAll(() {
    registerFallbackValue(VibrationEntity(duration: 0, amplitude: 0));
  });

  test('Initial state should be VibrationEntity with duration 0 and amplitude 0', (){
    expect(sut.state.duration, 0);
    expect(sut.state.amplitude, 0);
  });

  test('setDuration should update the duration in state', (){
    sut.setDuration(3000);
    expect(sut.state.duration, 3000);
  });

  test('setAmplitude should update the amplitude in state', (){
    sut.setAmplitude(255);
    expect(sut.state.amplitude, 255);
  });

  test('vibrate should call triggerVibrationUseCase with current state', () async {
    when(() => mockTriggerVibrationUseCase.call(any())).thenAnswer((_) async => Right(null));

    await sut.vibrate();

    verify(() => mockTriggerVibrationUseCase.call(sut.state)).called(1);
  });

}
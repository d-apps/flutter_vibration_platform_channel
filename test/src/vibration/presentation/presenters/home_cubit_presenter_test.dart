import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/presenters/vibration_cubit_presenter.dart';
import 'package:mocktail/mocktail.dart';

import '../../vibration_mocks.dart';

void main(){
  late VibrationCubitPresenter sut;
  late MockTriggerVibrationUseCase mockTriggerVibrationUseCase;

  setUp((){
    mockTriggerVibrationUseCase = MockTriggerVibrationUseCase();
    sut = VibrationCubitPresenter(triggerVibrationUseCase: mockTriggerVibrationUseCase);
  });


  tearDown(() {
    sut.close();
  });

  void mockVibrateMethod() {
    when(() => mockTriggerVibrationUseCase.call(any()))
        .thenAnswer((_) async => Right(null));
  }

  test('Initial state should be amplitude 0', (){
    final amplitude = 0;
    expect(sut.state, amplitude);
  });

  test('setAmplitude should update the amplitude in state', (){
    mockVibrateMethod();
    sut.updateAmplitude(255);
    expect(sut.state, 255);
  });

  test('vibrate should call triggerVibrationUseCase with current state', () async {
    mockVibrateMethod();
    await sut.vibrate();
    verify(() => mockTriggerVibrationUseCase.call(sut.state)).called(1);
  });

}
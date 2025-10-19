import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/core/services/vibration_service.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockVibrationService extends Mock implements IVibrationService {}

void main(){
  late TriggerVibrationUseCase sut;
  late IVibrationService service;

  setUp((){
    service = MockVibrationService();
    sut = TriggerVibrationUseCase(
      service: service,
    );
  });

  final amplitude = 1;

  test('should call the service with correct value', () async {
    when(() => service.vibrate(amplitude)).thenAnswer((_) async => Null);
    final result = await sut(amplitude);
    expect(result.isRight(), true);
    verify(() => service.vibrate(amplitude)).called(1);
  });

  test('should return an exception if the service throws', () async {
    when(() => service.vibrate(amplitude)).thenThrow(Exception('Service error'));
    final result = await sut(amplitude);
    expect(result.isLeft(), true);
    verify(() => service.vibrate(amplitude)).called(1);
  });
}
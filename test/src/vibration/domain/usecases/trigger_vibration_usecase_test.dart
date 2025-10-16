import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/core/services/vibration_service.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';
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

  test('should call the service with correct object', () async {
    final vibration = VibrationEntity(duration: 1, strength: 1);
    when(() => service.vibrate(vibration)).thenAnswer((_) async => Null);
    final result = await sut(vibration);
    expect(result.isRight(), true);
    verify(() => service.vibrate(vibration)).called(1);
  });

  test('should return an exception if the service throws', () async {
    final vibration = VibrationEntity(duration: 1, strength: 1);
    when(() => service.vibrate(vibration)).thenThrow(Exception('Service error'));
    final result = await sut(vibration);
    expect(result.isLeft(), true);
    verify(() => service.vibrate(vibration)).called(1);
  });
}
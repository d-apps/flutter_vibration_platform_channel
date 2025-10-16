import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/core/services/vibration_service.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/entities/vibration_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockMethodChannel extends Mock implements MethodChannel {}

void main() {
  late VibrationService sut;
  late MockMethodChannel methodChannel;

  setUp(() {
    methodChannel = MockMethodChannel();
    when(() => methodChannel.name).thenReturn('vibration');

    sut = VibrationService(
      methodChannel: methodChannel
    );
  });

  test(
    'should call vibrate method with correct entity and parameters',
    () async {

      when(() => methodChannel.invokeMethod(any(), any()))
          .thenAnswer((_) async {});

      final vibration = VibrationEntity(duration: 1, amplitude: 1);
      await sut.vibrate(vibration);

      const method = 'vibrate';
      final data = {
        'duration': vibration.duration,
        'strength': vibration.amplitude,
      };

      verify(() => methodChannel.invokeMethod(method, data)).called(1);

    },
  );

  test(
    'should throw an exception when method channel fails',
    () async {

      when(() => methodChannel.invokeMethod(any(), any()))
          .thenThrow(PlatformException(code: 'ERROR', message: 'Failed to vibrate'));

      final vibration = VibrationEntity(duration: 1, amplitude: 1);

      expect(
        () => sut.vibrate(vibration),
        throwsA(isA<Exception>().having((e) => e.toString(), 'description', contains('Failed to vibrate')))
      );


    },
  );
}

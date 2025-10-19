import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/core/services/vibration_service.dart';
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

  final amplitude =  1;

  test(
    'should call vibrate method with correct parameter',
    () async {

      when(() => methodChannel.invokeMethod(any(), any()))
          .thenAnswer((_) async {});

      await sut.vibrate(amplitude);

      const method = 'vibrate';
      final data = {
        'amplitude': amplitude,
      };

      verify(() => methodChannel.invokeMethod(method, data)).called(1);

    },
  );

  test(
    'should throw an exception when method channel fails',
    () async {

      when(() => methodChannel.invokeMethod(any(), any()))
          .thenThrow(PlatformException(code: 'ERROR', message: 'Failed to vibrate'));

      expect(
        () => sut.vibrate(amplitude),
        throwsA(isA<Exception>().having((e) => e.toString(), 'description', contains('Failed to vibrate')))
      );


    },
  );
}

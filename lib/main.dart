import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibration_platform_channel/core/services/vibration_service.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/presenters/vibration_cubit_presenter.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/vibration_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final methodChannel = const MethodChannel('vibration');
    final IVibrationService service = VibrationService(methodChannel: methodChannel);
    final ITriggerVibrationUseCase triggerVibrationUseCase = TriggerVibrationUseCase(service: service);

    /*
    final presenter = VibrationBlocPresenter(
        VibrationState(VibrationEntity(duration: 0, amplitude: 0)),
        triggerVibrationUseCase: triggerVibrationUseCase
    );
     */

    final presenter = VibrationCubitPresenter(triggerVibrationUseCase: triggerVibrationUseCase);

    return MaterialApp(
      home: VibrationPage(presenter: presenter),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibration_platform_channel/core/services/vibration_service.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/domain/usecases/trigger_vibration_usecase.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/bloc/home_bloc_presenter.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/cubit/home_cubit_presenter.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/home_page.dart';

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

    //final presenter = HomeBlocPresenter(triggerVibrationUseCase: triggerVibrationUseCase);
    final presenter = HomeCubitPresenter(triggerVibrationUseCase: triggerVibrationUseCase);

    return MaterialApp(
      home: HomePage(presenter: presenter),
    );
  }
}

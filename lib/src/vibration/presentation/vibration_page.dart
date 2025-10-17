import 'package:flutter/material.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/vibration_presenter.dart';

class VibrationPage extends StatelessWidget {
  final VibrationPresenter presenter;

  const VibrationPage({ required this.presenter, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Testing Native Vibration...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/home_presenter.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;

  const HomePage({ required this.presenter, super.key});

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

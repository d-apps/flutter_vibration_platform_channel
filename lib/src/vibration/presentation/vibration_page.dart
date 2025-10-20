import 'package:flutter/material.dart';
import 'package:flutter_vibration_platform_channel/src/vibration/presentation/vibration_presenter.dart';

class VibrationPage extends StatelessWidget {
  final VibrationPresenter presenter;

  const VibrationPage({ required this.presenter, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vibration Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Amplitude"),
              StreamBuilder<int>(
                stream: presenter.amplitudeStream,
                builder: (context, snapshot) {
                  final amplitude = snapshot.data ?? 0 ;
                  return Column(
                    children: [
                      Slider(
                        value: amplitude.toDouble(),
                        min: 0,
                        max: 255,
                        onChanged: (value) {
                          print(value.toInt());
                          presenter.updateAmplitude(value.toInt());
                        },
                      ),
                      Text("$amplitude"),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

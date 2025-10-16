import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _testNativeVibration();
  runApp(const MyApp());
}

Future<void> _testNativeVibration() async {
  const channel = MethodChannel('vibration');

  try {
    final result = await channel.invokeMethod('vibrate', {
      'duration': 500,
      'amplitude': 150,
    });
    debugPrint('✅ Flutter → Native success: $result');
  } on PlatformException catch (e) {
    debugPrint('❌ PlatformException: ${e.message}');
  } catch (e) {
    debugPrint('❌ Unknown error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Testing Native Vibration...',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

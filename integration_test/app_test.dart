import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/main.dart';
import 'package:integration_test/integration_test.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Drag the slider to change vibration amplitude',
      (WidgetTester tester) async {

        // load the app
        await tester.pumpWidget(const MyApp());

        // wait for the app to settle
        await tester.pumpAndSettle();

        // verify the slider and initial text
        expect(find.byType(Slider), findsOneWidget);
        expect(find.text('0'), findsOneWidget);

        await Future.delayed(const Duration(seconds: 1));

        // drag the slider to change amplitude
        await tester.drag(find.byType(Slider), const Offset(300, 0));
        await tester.pumpAndSettle();
        expect(find.text('0'), findsNothing);

        await Future.delayed(const Duration(seconds: 2));

      }
  );
}
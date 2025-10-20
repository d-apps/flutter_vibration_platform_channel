import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vibration_platform_channel/main.dart';
import 'package:flutter/material.dart';

void main(){
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    expect(find.byType(Slider), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // drag slider
    await tester.drag(find.byType(Slider), const Offset(300, 0));
    await tester.pumpAndSettle();
    expect(find.text('0'), findsNothing);
  });
}
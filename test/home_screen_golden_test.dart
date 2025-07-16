import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:habit_hero_new/features/habit/presentation/pages/home_screen.dart';

void main() {
  testWidgets('HomeScreen shows settings and add icons', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.byIcon(Icons.settings_outlined), findsOneWidget);
    expect(find.byIcon(Icons.add_rounded), findsOneWidget);
  });
}

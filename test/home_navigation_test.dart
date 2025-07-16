import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:habit_hero_new/features/habit/presentation/controller/habit_controller.dart';
import 'package:habit_hero_new/features/habit/presentation/pages/home_screen.dart';
import 'package:habit_hero_new/features/settings/presentation/pages/settings_page.dart';
import 'package:habit_hero_new/routes/app_routes.dart';

void main() {
  testWidgets('tapping settings navigates to SettingsPage', (tester) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.settings,
          builder: (_, __) => const SettingsPage(),
        ),
      ],
    );

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => HabitController(),
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    await tester.tap(find.byTooltip('Settings'));
    await tester.pumpAndSettle();

    expect(find.byType(SettingsPage), findsOneWidget);
  });
}

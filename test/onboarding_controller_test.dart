import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:habit_hero_new/core/services/theme_service.dart';
import 'package:habit_hero_new/core/services/user_prefs_service.dart';
import 'package:habit_hero_new/features/onboarding/presentation/controller/onboarding_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OnboardingController controller;
  late UserPrefsService prefs;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final shared = await SharedPreferences.getInstance();
    prefs = UserPrefsService(shared);
    await prefs.init();
    final themeService = ThemeService(shared);
    await themeService.init();
    GetIt.I.registerSingleton<ThemeService>(themeService);
    GetIt.I.registerSingleton<UserPrefsService>(prefs);
    controller = OnboardingController(prefs);
  });

  testWidgets('next increments index when showing whats new', (tester) async {
    await tester.pumpWidget(Builder(builder: (context) {
      controller.next(context);
      return Container();
    }));
    expect(controller.index, 1);
  });
}

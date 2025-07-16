import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get_it/get_it.dart';
import 'package:habit_hero_new/core/services/theme_service.dart';
import 'package:habit_hero_new/features/onboarding/presentation/controller/onboarding_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OnboardingController controller;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final themeService = ThemeService(prefs);
    await themeService.init();
    GetIt.I.registerSingleton<ThemeService>(themeService);
    controller = OnboardingController();
  });

  test('nextPage increments currentPage', () {
    expect(controller.currentPage, 0);
    controller.nextPage();
    expect(controller.currentPage, 1);
  });
}

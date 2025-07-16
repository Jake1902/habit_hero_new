import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../core/constants.dart';
import '../core/services/user_prefs_service.dart';
import '../features/habit/presentation/pages/home_screen.dart';
import '../features/onboarding/presentation/pages/theme_choice_page.dart';
import '../features/onboarding/presentation/controller/onboarding_controller.dart';
import '../features/onboarding/presentation/pages/welcome_page.dart';
import '../features/onboarding/presentation/pages/whats_new_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/stats/presentation/pages/stats_page.dart';
import '../routes/app_routes.dart';

class AppPages {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          final prefs = GetIt.I<UserPrefsService>();
          if (prefs.firstLaunch) return AppRoutes.onboardingWelcome;
          if (prefs.appVersionSeen != appVersion) {
            return AppRoutes.onboardingWhatsNew;
          }
          return AppRoutes.home;
        },
      ),
      GoRoute(
        path: AppRoutes.onboardingWelcome,
        builder: (_, __) => const WelcomePage(),
      ),
      GoRoute(
        path: AppRoutes.onboardingWhatsNew,
        builder: (_, __) => const WhatsNewPage(),
      ),
      GoRoute(
        path: AppRoutes.themeChoice,
        builder: (_, __) => ThemeChoicePage(
          controller: GetIt.I<OnboardingController>(),
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (_, __) => const SettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.stats,
        builder: (_, __) => const StatsPage(),
      ),
      GoRoute(
        path: AppRoutes.habitForm,
        builder: (_, __) => Scaffold(
          appBar: AppBar(title: const Text('Habit Form')),
          body: const Center(child: Text('Form coming soon')),
        ),
      ),
    ],
  );
}

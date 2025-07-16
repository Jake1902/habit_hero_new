import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../core/services/theme_service.dart';
import '../features/habit/presentation/pages/home_screen.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../routes/app_routes.dart';

class AppPages {
  static const onboarding = '/onboarding';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          final service = GetIt.I<ThemeService>();
          return service.firstLaunch ? onboarding : AppRoutes.home;
        },
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.habitForm,
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Habit Form')),
          body: const Center(child: Text('Form coming soon')),
        ),
      ),
    ],
  );
}

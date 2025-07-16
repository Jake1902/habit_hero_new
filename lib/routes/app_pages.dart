import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../core/services/theme_service.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../main.dart';

class AppPages {
  static const home = '/home';
  static const onboarding = '/onboarding';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) {
          final service = GetIt.I<ThemeService>();
          return service.firstLaunch ? onboarding : home;
        },
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const MyHomePage(title: 'Habit Hero'),
      ),
    ],
  );
}

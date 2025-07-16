import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants.dart';
import '../../../../core/services/theme_service.dart';
import '../../../../core/services/user_prefs_service.dart';
import '../../../../routes/app_routes.dart';

class OnboardingController extends ChangeNotifier {
  OnboardingController(this._prefs) : _themeService = GetIt.I<ThemeService>();

  final UserPrefsService _prefs;
  final ThemeService _themeService;

  final PageController pageController = PageController();
  int _index = 0;

  /// Exposed for tests that rely on the old API
  int get index => _index;

  /// Current page in the onboarding [PageView].
  int get currentPage => _index;

  AppTheme get theme => _themeService.theme;

  bool get showWhatsNew => _prefs.appVersionSeen != appVersion;

  /// Used by the old welcome/whats new pages to proceed to the next step.
  void next(BuildContext ctx) {
    if (_index == 0 && showWhatsNew) {
      _index = 1;
    } else if ((_index == 0 && !showWhatsNew) || _index == 1) {
      ctx.goNamed(AppRoutes.themeChoice);
    }
    notifyListeners();
  }

  /// Advances the page view to the next page.
  void nextPage() {
    if (_index < 2) {
      _index++;
      pageController.animateToPage(
        _index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void selectTheme(AppTheme theme) {
    _themeService.toggleTheme(theme);
    notifyListeners();
  }

  /// Completes onboarding and saves user preferences.
  Future<void> finish() async {
    _prefs
      ..firstLaunch = false
      ..appVersionSeen = appVersion;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

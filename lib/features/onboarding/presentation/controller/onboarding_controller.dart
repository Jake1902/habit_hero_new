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

  int _index = 0;
  int get index => _index;

  AppTheme get theme => _themeService.theme;

  bool get showWhatsNew => _prefs.appVersionSeen != appVersion;

  void next(BuildContext ctx) {
    if (_index == 0 && showWhatsNew) {
      _index = 1;
    } else if ((_index == 0 && !showWhatsNew) || _index == 1) {
      ctx.goNamed(AppRoutes.themeChoice);
    }
    notifyListeners();
  }

  void selectTheme(AppTheme theme) {
    _themeService.toggleTheme(theme);
    notifyListeners();
  }

  void finish(BuildContext ctx) {
    _prefs
      ..firstLaunch = false
      ..appVersionSeen = appVersion;
    ctx.goNamed(AppRoutes.home);
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark, highContrast }

class ThemeService extends ChangeNotifier {
  ThemeService(this._prefs);

  static const _themeKey = 'theme';
  static const _firstLaunchKey = 'firstLaunch';

  final SharedPreferences _prefs;
  AppTheme _theme = AppTheme.light;
  bool _firstLaunch = true;

  Future<void> init() async {
    final themeStr = _prefs.getString(_themeKey);
    if (themeStr != null) {
      _theme = AppTheme.values.firstWhere(
        (e) => e.name == themeStr,
        orElse: () => AppTheme.light,
      );
    }
    _firstLaunch = _prefs.getBool(_firstLaunchKey) ?? true;
  }

  AppTheme get theme => _theme;
  bool get firstLaunch => _firstLaunch;

  ThemeData get themeData {
    switch (_theme) {
      case AppTheme.dark:
        return ThemeData.dark(useMaterial3: true);
      case AppTheme.highContrast:
        return ThemeData.from(
          colorScheme: const ColorScheme.highContrastLight(),
          useMaterial3: true,
        );
      case AppTheme.light:
      default:
        return ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple);
    }
  }

  Future<void> toggleTheme(AppTheme theme) async {
    _theme = theme;
    await _prefs.setString(_themeKey, theme.name);
    notifyListeners();
  }

  Future<void> setFirstLaunchFalse() async {
    _firstLaunch = false;
    await _prefs.setBool(_firstLaunchKey, false);
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefsService extends ChangeNotifier {
  UserPrefsService(this._prefs);

  static const _firstLaunchKey = 'firstLaunch';
  static const _versionKey = 'appVersionSeen';

  final SharedPreferences _prefs;

  bool _firstLaunch = true;
  String? _appVersionSeen;

  Future<void> init() async {
    _firstLaunch = _prefs.getBool(_firstLaunchKey) ?? true;
    _appVersionSeen = _prefs.getString(_versionKey);
  }

  bool get firstLaunch => _firstLaunch;
  String? get appVersionSeen => _appVersionSeen;

  set firstLaunch(bool value) {
    _firstLaunch = value;
    _prefs.setBool(_firstLaunchKey, value);
    notifyListeners();
  }

  set appVersionSeen(String? value) {
    _appVersionSeen = value;
    if (value == null) {
      _prefs.remove(_versionKey);
    } else {
      _prefs.setString(_versionKey, value);
    }
    notifyListeners();
  }
}

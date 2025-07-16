import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/services/theme_service.dart';

class OnboardingController extends ChangeNotifier {
  OnboardingController() : _themeService = GetIt.I<ThemeService>();

  final ThemeService _themeService;
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < 2) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
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

  Future<void> finish() async {
    await _themeService.setFirstLaunchFalse();
  }

  AppTheme get theme => _themeService.theme;
}

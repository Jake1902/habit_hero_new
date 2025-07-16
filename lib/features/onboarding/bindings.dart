import 'package:get_it/get_it.dart';

import 'presentation/controller/onboarding_controller.dart';

class OnboardingBindings {
  static void register() {
    final getIt = GetIt.instance;
    getIt.registerFactory<OnboardingController>(OnboardingController.new);
  }
}

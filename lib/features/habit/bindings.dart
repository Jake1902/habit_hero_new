import 'package:get_it/get_it.dart';

import 'presentation/controller/home_controller.dart';

class HabitBindings {
  static void register() {
    final getIt = GetIt.instance;
    getIt.registerFactory<HomeController>(HomeController.new);
  }
}

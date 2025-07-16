import 'package:flutter/foundation.dart';

import '../../domain/entities/habit.dart';

class HabitController extends ChangeNotifier {
  final List<Habit> _habits = [];

  List<Habit> get habits => List.unmodifiable(_habits);

  void addHabit(Habit habit) {
    _habits.add(habit);
    notifyListeners();
  }
}

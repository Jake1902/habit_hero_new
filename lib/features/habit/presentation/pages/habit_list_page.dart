import 'package:flutter/material.dart';

import '../../domain/entities/habit.dart';

class HabitListPage extends StatelessWidget {
  final List<Habit> habits;

  const HabitListPage({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        return ListTile(title: Text(habit.title));
      },
    );
  }
}

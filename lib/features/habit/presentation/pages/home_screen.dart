import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../routes/app_routes.dart';
import '../controller/habit_controller.dart';
import 'habit_list_page.dart';
import '../widgets/empty_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HabitController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings_outlined),
          tooltip: 'Settings',
          onPressed: () => context.pushNamed(AppRoutes.settings),
        ),
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleLarge,
            children: const [
              TextSpan(text: 'Habit'),
              TextSpan(
                text: 'Hero',
                style: TextStyle(color: Color(0xFFBB55FF)),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.show_chart_outlined),
            tooltip: 'Statistics',
            onPressed: () => context.pushNamed(AppRoutes.stats),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'New habit',
            onPressed: () => context.pushNamed(AppRoutes.habitForm),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: controller.habits.isEmpty
            ? const EmptyStateWidget()
            : HabitListPage(habits: controller.habits),
      ),
    );
  }
}

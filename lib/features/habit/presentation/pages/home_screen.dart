import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Habit Hero',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.settings_outlined),
          tooltip: 'Settings',
          onPressed: () => context.pushNamed(AppRoutes.settings),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            tooltip: 'New habit',
            onPressed: () => context.pushNamed(AppRoutes.habitForm),
          ),
        ],
        backgroundColor: t.colorScheme.surface,
        surfaceTintColor: t.colorScheme.surfaceTint,
      ),
      body: const Center(child: Text('Dashboard coming soon')),
    );
  }
}

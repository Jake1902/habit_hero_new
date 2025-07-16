import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/app_routes.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final accent = const Color(0xFFBB55FF);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: accent, width: 2),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(16),
            child: Icon(Icons.add, size: 48, color: accent),
          ),
          const SizedBox(height: 24),
          Text('No habit found', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            'Create a new habit to track your progress',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: accent),
            onPressed: () => context.pushNamed(AppRoutes.habitForm),
            child: const Text('Get started'),
          ),
        ],
      ),
    );
  }
}

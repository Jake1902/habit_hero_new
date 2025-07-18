import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../core/services/theme_service.dart';
import '../../../../routes/app_routes.dart';
import '../controller/onboarding_controller.dart';

class ThemeChoicePage extends StatelessWidget {
  const ThemeChoicePage({super.key, required this.controller});

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = controller.theme;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Choose your theme',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: AppTheme.values
                    .map(
                      (t) => _ThemeCard(
                        title: t.name,
                        selected: theme == t,
                        onTap: () => controller.selectTheme(t),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  await controller.finish();
                  if (context.mounted) {
                    context.go(AppRoutes.home);
                  }
                },
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeCard extends StatelessWidget {
  const _ThemeCard({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: selected ? Theme.of(context).colorScheme.primary : null,
        child: SizedBox(
          width: 80,
          height: 100,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: selected
                    ? Theme.of(context).colorScheme.onPrimary
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

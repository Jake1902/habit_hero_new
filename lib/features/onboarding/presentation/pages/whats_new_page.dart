import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/onboarding_controller.dart';

class WhatsNewPage extends StatelessWidget {
  const WhatsNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I<OnboardingController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    Align(
                      alignment: const Alignment(-0.4, -0.2),
                      child: Icon(Icons.smartphone, size: 160, color: Colors.grey.withOpacity(0.4)),
                    ),
                    Align(
                      alignment: const Alignment(0.4, 0.2),
                      child: Icon(Icons.smartphone, size: 160, color: Colors.grey.withOpacity(0.4)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'MAJOR UPDATE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'New Habit Detail View',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              const Text(
                'Experience a redesigned habit view with improved interactions.',
              ),
              const SizedBox(height: 16),
              const _FeatureTile(
                icon: Icons.event,
                title: 'Integrated Calendar',
              ),
              const _FeatureTile(
                icon: Icons.list_alt,
                title: 'Compact List',
              ),
              const _FeatureTile(
                icon: Icons.bug_report,
                title: 'Bugfixes',
              ),
              const Spacer(),
              FilledButton(
                onPressed: () => controller.next(context),
                child: const Text('Continue'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/controller/onboarding_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I<OnboardingController>();
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0E0E0E), Color(0xFF111827)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.headlineSmall,
                  children: [
                    const TextSpan(text: 'Welcome to '),
                    TextSpan(
                      text: 'HabitHero',
                      style: TextStyle(color: theme.colorScheme.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const _FeatureTile(
                icon: Icons.check_circle_outline,
                title: 'Track Habits',
                subtitle: 'Monitor your daily progress',
              ),
              const _FeatureTile(
                icon: Icons.alarm,
                title: 'Reminders',
                subtitle: 'Never forget a habit',
              ),
              const _FeatureTile(
                icon: Icons.bar_chart,
                title: 'Statistics',
                subtitle: 'Visualize improvement',
              ),
              const _FeatureTile(
                icon: Icons.stacked_line_chart,
                title: 'Streaks',
                subtitle: 'Stay motivated every day',
              ),
              const _FeatureTile(
                icon: Icons.flag,
                title: 'Goals',
                subtitle: 'Set achievable targets',
              ),
              const _FeatureTile(
                icon: Icons.widgets,
                title: 'Widgets',
                subtitle: 'Quick access on home',
              ),
              const _FeatureTile(
                icon: Icons.dark_mode,
                title: 'Dark Mode',
                subtitle: 'Easy on the eyes',
              ),
              const _FeatureTile(
                icon: Icons.privacy_tip,
                title: 'Privacy',
                subtitle: 'Your data stays local',
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
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}

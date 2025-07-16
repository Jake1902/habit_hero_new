import 'package:flutter/material.dart';

import '../controller/onboarding_controller.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key, required this.controller});

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.auto_awesome, size: 120),
          const SizedBox(height: 32),
          Text(
            'Welcome to Habit Hero',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Track and improve your habits with ease.',
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: controller.nextPage,
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

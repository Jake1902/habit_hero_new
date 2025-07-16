import 'package:flutter/material.dart';

import '../controller/onboarding_controller.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key, required this.controller});

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.privacy_tip, size: 120),
          const SizedBox(height: 32),
          Text(
            'Privacy First',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Your data stays on your device.',
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

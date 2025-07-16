import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/app_pages.dart';
import '../../../onboarding/presentation/controller/onboarding_controller.dart';
import '../../../onboarding/presentation/pages/intro_page.dart';
import '../../../onboarding/presentation/pages/privacy_page.dart';
import '../../../onboarding/presentation/pages/theme_choice_page.dart';
import '../../../onboarding/presentation/widgets/progress_dots.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final OnboardingController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.I<OnboardingController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    IntroPage(controller: controller),
                    PrivacyPage(controller: controller),
                    ThemeChoicePage(controller: controller),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ProgressDots(current: controller.currentPage, total: 3),
              const SizedBox(height: 16),
              if (controller.currentPage == 2)
                ElevatedButton(
                  onPressed: () async {
                    await controller.finish();
                    if (context.mounted) {
                      context.go(AppPages.home);
                    }
                  },
                  child: const Text('Get Started'),
                )
              else
                ElevatedButton(
                  onPressed: controller.nextPage,
                  child: const Text('Next'),
                ),
              const SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }
}

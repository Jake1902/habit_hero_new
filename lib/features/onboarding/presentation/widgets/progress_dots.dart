import 'package:flutter/material.dart';

class ProgressDots extends StatelessWidget {
  const ProgressDots({super.key, required this.current, required this.total});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        total,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: current == index ? 12 : 8,
          height: current == index ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: current == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
    );
  }
}

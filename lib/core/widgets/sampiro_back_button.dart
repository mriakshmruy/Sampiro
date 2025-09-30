import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SampiroBackButton extends StatelessWidget {
  const SampiroBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () => context.maybePop(),
        child: Container(
          decoration: BoxDecoration(color: theme.colorScheme.primary, shape: BoxShape.circle),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

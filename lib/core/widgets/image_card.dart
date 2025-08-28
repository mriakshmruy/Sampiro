import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({required this.image, required this.title, super.key, this.onTap, this.padding});

  final Widget image;
  final String title;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: image,
            ),

            Positioned.fill(
              child: Container(
                color: theme.colorScheme.primary.withValues(alpha: .5),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.surface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

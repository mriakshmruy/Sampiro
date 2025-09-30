import 'package:app_ui/app_ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SampiroCachedNetworkImage extends StatelessWidget {
  const SampiroCachedNetworkImage({
    required this.url,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.borderColor = Colors.transparent,
    this.border,
    this.errorImageFilePath,
    super.key,
  });

  final String url;
  final BorderRadius? borderRadius;
  final BoxFit fit;
  final Color borderColor;
  final BoxBorder? border;
  final String? errorImageFilePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = borderRadius ?? const BorderRadius.all(UIConstants.radiusCircular);
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (_, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: border ?? Border.all(color: borderColor),
          image: DecorationImage(image: imageProvider, fit: fit),
        ),
      ),
      placeholder: (_, _) => const Center(child: CircularProgressIndicator()),
      errorWidget: (_, _, _) => errorImageFilePath != null
          ? Container(
              decoration: BoxDecoration(
                borderRadius: radius,
                border: Border.all(color: borderColor),
                image: DecorationImage(image: AssetImage(errorImageFilePath!), fit: fit),
              ),
            )
          : Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.shadow,
                borderRadius: radius,
                border: Border.all(color: borderColor),
              ),
              child: Icon(Icons.error, color: theme.colorScheme.surface.withValues(alpha: .6)),
            ),
    );
  }
}

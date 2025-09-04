import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SampiroPageLoader extends StatelessWidget {
  const SampiroPageLoader({
    required this.child,
    required this.isLoading,
    this.loaderSize = 60,
    super.key,
  });

  final Widget child;
  final bool isLoading;
  final double loaderSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            alignment: Alignment.center,
            color: theme.colorScheme.surface.withOpacity(.8),
            child: SizedBox(
              width: loaderSize,
              height: loaderSize,
              child: SpinKitFadingCircle(color: theme.colorScheme.primary),
            ),
          ),
      ],
    );
  }
}

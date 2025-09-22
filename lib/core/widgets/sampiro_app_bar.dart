import 'package:app_ui/app_ui.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SampiroAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SampiroAppBar({super.key, this.title, this.actions, this.appBarColor, this.leading});

  final String? title;
  final List<Widget>? actions;
  final Color? appBarColor;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      actions: actions,
      backgroundColor: appBarColor ?? theme.colorScheme.primary,
      leading: leading,
      centerTitle: true,
      title: title != null
          ? AutoSizeText(
              title!,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: SampiroFontWeight.medium,
                color: SampiroColors.white,
              ),
              maxLines: 1,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

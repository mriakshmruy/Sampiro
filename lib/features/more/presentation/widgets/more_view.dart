import 'package:flutter/material.dart';
import 'package:sampiro/l10n/l10n.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.more),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sampiro/l10n/l10n.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.services),
      ),
    );
  }
}

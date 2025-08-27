import 'package:flutter/material.dart';
import 'package:sampiro/features/services/presentation/bloc/bloc.dart';
import 'package:sampiro/features/services/presentation/widgets/services_view.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServicesBloc(),
      child: const ServicesView(),
    );
  }
}

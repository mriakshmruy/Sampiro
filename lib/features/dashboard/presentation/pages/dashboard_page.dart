import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/dashboard/presentation/bloc/bloc.dart';
import 'package:sampiro/features/dashboard/presentation/widgets/dashboard_view.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc(),
      child: const DashboardView(),
    );
  }
}

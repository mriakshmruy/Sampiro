import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/updates/presentation/bloc/bloc.dart';
import 'package:sampiro/features/updates/presentation/widgets/updates_view.dart';

@RoutePage()
class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdatesBloc(),
      child: const UpdatesView(),
    );
  }
}

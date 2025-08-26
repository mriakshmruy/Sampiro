import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/prayers/presentation/bloc/bloc.dart';
import 'package:sampiro/features/prayers/presentation/widgets/prayers_view.dart';

@RoutePage()
class PrayersPage extends StatelessWidget {
  const PrayersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrayersBloc(),
      child: const PrayersView(),
    );
  }
}

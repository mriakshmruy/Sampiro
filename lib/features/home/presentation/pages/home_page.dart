import 'package:flutter/material.dart';
import 'package:sampiro/features/home/presentation/bloc/bloc.dart';
import 'package:sampiro/features/home/presentation/widgets/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

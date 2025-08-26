import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/menu/presentation/bloc/bloc.dart';
import 'package:sampiro/features/menu/presentation/widgets/menu_view.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenuBloc(),
      child: const MenuView(),
    );
  }
}

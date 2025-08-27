import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/more/presentation/bloc/bloc.dart';
import 'package:sampiro/features/more/presentation/widgets/more_view.dart';

@RoutePage()
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoreBloc(),
      child: const MoreView(),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/dependency_injection.dart';
import 'package:sampiro/features/reflection/domain/repositories/ireflection_repository.dart';
import 'package:sampiro/features/reflection/presentation/bloc/reflection_bloc.dart';
import 'package:sampiro/features/reflection/presentation/widgets/reflection_view.dart';

@RoutePage()
class ReflectionPage extends StatelessWidget {
  const ReflectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReflectionBloc(reflectionRepository: getIt<IReflectionRepository>())
            ..add(const ReflectionCurrentReflectionFetched()),
      child: const ReflectionView(),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampiro/dependency_injection.dart';
import 'package:sampiro/features/testimonial/domain/repositories/itestimonial_repository.dart';
import 'package:sampiro/features/testimonial/presentation/bloc/testimonial_bloc.dart';

@RoutePage()
class TestimonialBlocWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  const TestimonialBlocWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TestimonialBloc(testimonialRepository: getIt<ITestimonialRepository>())..add(const TestimonialFetched()),
      child: this,
    );
  }
}

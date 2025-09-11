import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/app/bloc/bloc.dart';
import 'package:sampiro/dependency_injection.dart';
import 'package:sampiro/features/services/domain/repositories/iservices_repository.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
import 'package:sampiro/features/services/presentation/widgets/schedule_a_blessing_view.dart';

@RoutePage()
class ScheduleABlessingPage extends StatelessWidget {
  const ScheduleABlessingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesBloc(servicesRepository: getIt<IServicesRepository>()),
      child: const ScheduleABlessingView(),
    );
  }
}

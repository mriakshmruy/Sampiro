import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/features/dashboard/presentation/bloc/bloc.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
import 'package:sampiro/features/services/presentation/widgets/baptismal_certificate_view.dart';

@RoutePage()
class BaptismalCertificatePage extends StatelessWidget {
  const BaptismalCertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServicesBloc(),
      child: const BaptismalCertificateView(),
    );
  }
}

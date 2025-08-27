// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
void main() {
  late ServicesBloc servicesBloc;

  setUp(() {
    servicesBloc = ServicesBloc();
  });

  tearDown(() => servicesBloc.close());

  blocTest<ServicesBloc, ServicesState>(
    'emits nothing when servicesStarted is called',
    build: () => servicesBloc,
    act: (bloc) => bloc.add(const ServicesStarted(status: ServicesStatus.none)),
    expect: () => const <ServicesState>[],
  );
}

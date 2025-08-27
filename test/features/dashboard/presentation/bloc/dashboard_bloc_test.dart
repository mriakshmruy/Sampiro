// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampiro/features/dashboard/presentation/bloc/dashboard_bloc.dart';
void main() {
  late DashboardBloc dashboardBloc;

  setUp(() {
    dashboardBloc = DashboardBloc();
  });

  tearDown(() => dashboardBloc.close());

  blocTest<DashboardBloc, DashboardState>(
    'emits nothing when dashboardStarted is called',
    build: () => dashboardBloc,
    act: (bloc) => bloc.add(const DashboardStarted(status: DashboardStatus.none)),
    expect: () => const <DashboardState>[],
  );
}

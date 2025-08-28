// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampiro/app/bloc/app_bloc.dart';

void main() {
  late AppBloc appBloc;

  setUp(() {
    appBloc = AppBloc();
  });

  tearDown(() => appBloc.close());

  blocTest<AppBloc, AppState>(
    'emits nothing when appStarted is called',
    build: () => appBloc,
    act: (bloc) => bloc.add(const AppStarted(status: AppStatus.none)),
    expect: () => const <AppState>[],
  );
}

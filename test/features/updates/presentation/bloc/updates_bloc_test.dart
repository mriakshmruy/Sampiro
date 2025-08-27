// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampiro/features/updates/presentation/bloc/updates_bloc.dart';
void main() {
  late UpdatesBloc updatesBloc;

  setUp(() {
    updatesBloc = UpdatesBloc();
  });

  tearDown(() => updatesBloc.close());

  blocTest<UpdatesBloc, UpdatesState>(
    'emits nothing when updatesStarted is called',
    build: () => updatesBloc,
    act: (bloc) => bloc.add(const UpdatesStarted(status: UpdatesStatus.none)),
    expect: () => const <UpdatesState>[],
  );
}

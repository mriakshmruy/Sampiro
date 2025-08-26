// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampiro/features/prayers/presentation/bloc/prayers_bloc.dart';
void main() {
  late PrayersBloc prayersBloc;

  setUp(() {
    prayersBloc = PrayersBloc();
  });

  tearDown(() => prayersBloc.close());

  blocTest<PrayersBloc, PrayersState>(
    'emits nothing when prayersStarted is called',
    build: () => prayersBloc,
    act: (bloc) => bloc.add(const PrayersStarted(status: PrayersStatus.none)),
    expect: () => const <PrayersState>[],
  );
}

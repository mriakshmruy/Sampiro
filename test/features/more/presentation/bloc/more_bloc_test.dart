// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampiro/features/more/presentation/bloc/more_bloc.dart';
void main() {
  late MoreBloc moreBloc;

  setUp(() {
    moreBloc = MoreBloc();
  });

  tearDown(() => moreBloc.close());

  blocTest<MoreBloc, MoreState>(
    'emits nothing when moreStarted is called',
    build: () => moreBloc,
    act: (bloc) => bloc.add(const MoreStarted(status: MoreStatus.none)),
    expect: () => const <MoreState>[],
  );
}

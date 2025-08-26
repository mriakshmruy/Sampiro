import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampiro/features/home/presentation/bloc/home_bloc.dart';

void main() {
  late HomeBloc homeBloc;

  setUp(() {
    homeBloc = HomeBloc();
  });

  tearDown(() => homeBloc.close());

  blocTest<HomeBloc, HomeState>(
    'emits nothing when homeStarted is called',
    build: () => homeBloc,
    act: (bloc) => bloc.add(const HomeStarted(status: HomeStatus.none)),
    expect: () => const <HomeState>[],
  );
}

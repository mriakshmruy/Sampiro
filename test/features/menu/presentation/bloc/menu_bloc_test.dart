// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampiro/features/menu/presentation/bloc/menu_bloc.dart';
void main() {
  late MenuBloc menuBloc;

  setUp(() {
    menuBloc = MenuBloc();
  });

  tearDown(() => menuBloc.close());

  blocTest<MenuBloc, MenuState>(
    'emits nothing when menuStarted is called',
    build: () => menuBloc,
    act: (bloc) => bloc.add(const MenuStarted(status: MenuStatus.none)),
    expect: () => const <MenuState>[],
  );
}

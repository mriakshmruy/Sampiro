part of 'menu_bloc.dart';

enum MenuStatus { none, loading, successful, failed }

@freezed
abstract class MenuState with _$MenuState { 
  const factory MenuState({
    @Default(MenuStatus.none) MenuStatus status,
  }) = _MenuState;
  const MenuState._();
}

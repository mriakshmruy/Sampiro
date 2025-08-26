part of 'menu_bloc.dart';

@freezed
abstract class MenuEvent with _$MenuEvent {
  const factory MenuEvent.started({required MenuStatus status}) = MenuStarted;
}

part of 'app_bloc.dart';

@freezed
abstract class AppEvent with _$AppEvent {
  const factory AppEvent.started({required AppStatus status}) = AppStarted;
}

part of 'app_bloc.dart';

enum AppStatus { none, loading, successful, failed }

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(AppStatus.none) AppStatus status,
    @Default('') String version,
    @Default('') String buildNumber,
  }) = _AppState;
  const AppState._();
}

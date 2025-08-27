part of 'dashboard_bloc.dart';

enum DashboardStatus { none, loading, successful, failed }

@freezed
abstract class DashboardState with _$DashboardState { 
  const factory DashboardState({
    @Default(DashboardStatus.none) DashboardStatus status,
  }) = _DashboardState;
  const DashboardState._();
}

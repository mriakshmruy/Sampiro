part of 'home_bloc.dart';

enum HomeStatus { none, loading, successful, failed }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.none) HomeStatus status,
  }) = _HomeState;
  const HomeState._();
}

part of 'home_bloc.dart';

enum HomeStatus { none, loading, successful, failed }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.none) HomeStatus status,
    String? email,
    @Default(true) bool isValid,
  }) = _HomeState;
  const HomeState._();
}

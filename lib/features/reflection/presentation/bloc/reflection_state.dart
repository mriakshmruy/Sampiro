part of 'reflection_bloc.dart';

enum ReflectionStatus { none, loading, successful, failed }

@freezed
abstract class ReflectionState with _$ReflectionState {
  const factory ReflectionState({
    @Default(ReflectionStatus.none) ReflectionStatus status,
    String? errorMessage,
    @Default(ParishReflectionModel.empty) ParishReflectionModel reflection,
  }) = _ReflectionState;
  const ReflectionState._();
}

part of 'reflection_bloc.dart';

@freezed
abstract class ReflectionEvent with _$ReflectionEvent {
  const factory ReflectionEvent.currentReflectionFetched() = ReflectionCurrentReflectionFetched;
}

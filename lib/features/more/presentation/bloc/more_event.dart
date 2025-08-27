part of 'more_bloc.dart';

@freezed
abstract class MoreEvent with _$MoreEvent {
  const factory MoreEvent.started({required MoreStatus status}) = MoreStarted;
}

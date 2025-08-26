part of 'prayers_bloc.dart';

@freezed
abstract class PrayersEvent with _$PrayersEvent {
  const factory PrayersEvent.started({required PrayersStatus status}) = PrayersStarted;
}

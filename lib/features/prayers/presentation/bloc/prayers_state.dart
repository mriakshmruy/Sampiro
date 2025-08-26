part of 'prayers_bloc.dart';

enum PrayersStatus { none, loading, successful, failed }

@freezed
abstract class PrayersState with _$PrayersState { 
  const factory PrayersState({
    @Default(PrayersStatus.none) PrayersStatus status,
  }) = _PrayersState;
  const PrayersState._();
}

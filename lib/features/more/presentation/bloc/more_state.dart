part of 'more_bloc.dart';

enum MoreStatus { none, loading, successful, failed }

@freezed
abstract class MoreState with _$MoreState { 
  const factory MoreState({
    @Default(MoreStatus.none) MoreStatus status,
  }) = _MoreState;
  const MoreState._();
}

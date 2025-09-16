part of 'updates_bloc.dart';

enum UpdatesStatus { none, loading, successful, failed }

@freezed
abstract class UpdatesState with _$UpdatesState {
  const factory UpdatesState({
    @Default(UpdatesStatus.none) UpdatesStatus status,
    @Default('') String? errorMessage,
    @Default([]) List<ParishUpdateModel> updateList,
  }) = _UpdatesState;
  const UpdatesState._();
}

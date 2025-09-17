part of 'updates_bloc.dart';

enum UpdatesStatus { none, loading, successful, failed }

@freezed
abstract class UpdatesState with _$UpdatesState {
  const factory UpdatesState({
    // For fetching of updates
    @Default(UpdatesStatus.none) UpdatesStatus status,
    @Default('') String? errorMessage,
    @Default([]) List<ParishUpdateModel> updateList,

    // For fetching of pagination
    @Default(true) bool hasNextPage,
    @Default(UpdatesStatus.none) UpdatesStatus updateParishStatus,
  }) = _UpdatesState;
  const UpdatesState._();
}

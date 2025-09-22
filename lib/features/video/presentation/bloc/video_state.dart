part of 'video_bloc.dart';

enum VideoStatus { none, loading, successful, failed }

@freezed
abstract class VideoState with _$VideoState {
  const factory VideoState({
    //For Fetching
    @Default(VideoStatus.none) VideoStatus statusForVideoFetching,
    @Default([]) List<ParishVideo> videoList,
    String? errorForFetchingVideoMessage,

    // Pagination
    @Default(true) bool hasNextPage,
    @Default(VideoStatus.none) VideoStatus statusForVideosPagination,
  }) = _VideoState;
  const VideoState._();
}

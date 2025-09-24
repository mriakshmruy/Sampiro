part of 'video_bloc.dart';

@freezed
abstract class VideoEvent with _$VideoEvent {
  const factory VideoEvent.videosFetched() = VideosFetched;
  const factory VideoEvent.loadMore() = VideosLoadMore;
}

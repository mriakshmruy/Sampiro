import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampiro/features/video/data/models/parish_video_model.dart';
import 'package:sampiro/features/video/domain/repositories/iparish_video_repository.dart';

part 'video_bloc.freezed.dart';
part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc({
    required IParishVideoRepository parishVideoRepository,
  }) : _parishVideoRepository = parishVideoRepository,
       super(const VideoState()) {
    on<VideosFetched>(_onVideosFetched);
    on<VideosLoadMore>(_onVideosLoadMore);
  }

  final IParishVideoRepository _parishVideoRepository;

  final resultPerPage = 1;

  Future<void> _onVideosFetched(VideosFetched event, Emitter<VideoState> emit) async {
    emit(state.copyWith(statusForVideoFetching: VideoStatus.loading, errorForFetchingVideoMessage: null));

    final result = await _parishVideoRepository.fetchVideo(resultPerPage);
    result.fold(
      (failure) {
        emit(state.copyWith(statusForVideoFetching: VideoStatus.failed, errorForFetchingVideoMessage: failure.message));
      },
      (videoList) {
        emit(
          state.copyWith(
            statusForVideoFetching: VideoStatus.successful,
            errorForFetchingVideoMessage: null,
            videoList: videoList,
            hasNextPage: videoList.length == resultPerPage,
          ),
        );
      },
    );
  }

  Future<void> _onVideosLoadMore(VideosLoadMore event, Emitter<VideoState> emit) async {
    if (state.statusForVideosPagination == VideoStatus.loading || !state.hasNextPage) return;

    emit(state.copyWith(statusForVideosPagination: VideoStatus.loading));

    final result = await _parishVideoRepository.fetchMoreVideo(resultPerPage);
    result.fold(
      (_) {
        emit(state.copyWith(statusForVideosPagination: VideoStatus.failed));
      },
      (videoList) {
        emit(
          state.copyWith(
            videoList: [...state.videoList, ...videoList],
            statusForVideosPagination: VideoStatus.successful,
            hasNextPage: videoList.length == resultPerPage,
          ),
        );
      },
    );
  }
}

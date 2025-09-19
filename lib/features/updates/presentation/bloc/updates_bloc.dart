import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampiro/features/updates/data/models/parish_update_model.dart';
import 'package:sampiro/features/updates/domain/repositories/iparish_updates_repository.dart';

part 'updates_bloc.freezed.dart';
part 'updates_event.dart';
part 'updates_state.dart';

class UpdatesBloc extends Bloc<UpdatesEvent, UpdatesState> {
  UpdatesBloc({required IParishUpdatesRepository parishUpdatesRepository})
    : _parishUpdatesRepository = parishUpdatesRepository,
      super(const UpdatesState()) {
    on<UpdatesParishUpdateFetched>(_onUpdatesParishUpdateFetched);
    on<UpdatesParishMoreUpdateFetched>(_onUpdatesParishMoreUpdateFetched);
  }

  final IParishUpdatesRepository _parishUpdatesRepository;

  final resultPerPage = 10;

  Future<void> _onUpdatesParishMoreUpdateFetched(
    UpdatesParishMoreUpdateFetched event,
    Emitter<UpdatesState> emit,
  ) async {
    // state.hasNextPage == false same with this ->  !state.hasNextPag = Negate
    if (state.updateParishStatus == UpdatesStatus.loading || !state.hasNextPage) return;

    emit(state.copyWith(status: UpdatesStatus.loading, errorMessage: null));

    final newUpdates = await _parishUpdatesRepository.fetchMoreParishUpdates(resultPerPage);

    newUpdates.fold(
      (left) {
        emit(state.copyWith(status: UpdatesStatus.failed, errorMessage: left.message));
      },
      (newUpdates) {
        final updatedList = [...state.updateList, ...newUpdates];

        emit(
          state.copyWith(
            updateList: updatedList,
            updateParishStatus: UpdatesStatus.successful,
            hasNextPage: newUpdates.length == resultPerPage,
          ),
        );
      },
    );
  }

  Future<void> _onUpdatesParishUpdateFetched(
    UpdatesParishUpdateFetched event,
    Emitter<UpdatesState> emit,
  ) async {
    emit(state.copyWith(status: UpdatesStatus.loading, errorMessage: null));

    final result = await _parishUpdatesRepository.fetchParishUpdates(resultPerPage);

    result.fold(
      (left) {
        emit(
          state.copyWith(status: UpdatesStatus.failed, errorMessage: left.message),
        );
      },
      (updateList) {
        emit(
          state.copyWith(
            status: UpdatesStatus.successful,
            errorMessage: null,
            updateList: updateList,
          ),
        );
      },
    );
  }
}

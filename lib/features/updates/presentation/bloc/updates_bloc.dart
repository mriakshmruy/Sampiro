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
  }

  final IParishUpdatesRepository _parishUpdatesRepository;

  Future<void> _onUpdatesParishUpdateFetched(
    UpdatesParishUpdateFetched event,
    Emitter<UpdatesState> emit,
  ) async {
    emit(state.copyWith(status: UpdatesStatus.loading, errorMessage: null));

    final result = await _parishUpdatesRepository.fetchParishUpdates(13);

    result.fold(
      (left) {
        if (!kReleaseMode) debugPrint('$left');

        emit(
          state.copyWith(status: UpdatesStatus.failed, errorMessage: left.message),
        );
      },
      (updateList) {
        if (!kReleaseMode) debugPrint('$updateList');
        if (!kReleaseMode) debugPrint('${updateList.length}');
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

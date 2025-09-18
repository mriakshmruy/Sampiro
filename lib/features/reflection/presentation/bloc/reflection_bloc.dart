import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sampiro/features/reflection/data/model/parish_reflection_model.dart';
import 'package:sampiro/features/reflection/domain/repositories/ireflection_repository.dart';

part 'reflection_bloc.freezed.dart';
part 'reflection_event.dart';
part 'reflection_state.dart';

class ReflectionBloc extends Bloc<ReflectionEvent, ReflectionState> {
  ReflectionBloc({required IReflectionRepository reflectionRepository})
    : _reflectionRepository = reflectionRepository,
      super(const ReflectionState()) {
    on<ReflectionCurrentReflectionFetched>(_onReflectionCurrentReflectionFetched);
  }

  final IReflectionRepository _reflectionRepository;

  Future<void> _onReflectionCurrentReflectionFetched(
    ReflectionCurrentReflectionFetched event,
    Emitter<ReflectionState> emit,
  ) async {
    emit(state.copyWith(status: ReflectionStatus.loading, errorMessage: null));

    final result = await _reflectionRepository.fetchCurrentReflection(DateTime.now());

    result.fold(
      (left) {
        emit(state.copyWith(status: ReflectionStatus.failed, errorMessage: left.message));
      },
      (reflection) {
        emit(state.copyWith(status: ReflectionStatus.successful, errorMessage: null, reflection: reflection));
      },
    );
  }
}

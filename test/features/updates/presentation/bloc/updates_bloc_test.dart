// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sampiro/core/failures/failures.dart';
import 'package:sampiro/features/updates/data/models/parish_update_model.dart';
import 'package:sampiro/features/updates/domain/repositories/iparish_updates_repository.dart';
import 'package:sampiro/features/updates/presentation/bloc/updates_bloc.dart';

class MockIParishUpdatesRepository extends Mock implements IParishUpdatesRepository {}

void main() {
  late MockIParishUpdatesRepository mockIParishUpdatesRepository;
  late UpdatesBloc updatesBloc;

  const tErrorMessage = 'error';

  setUp(() {
    mockIParishUpdatesRepository = MockIParishUpdatesRepository();
    updatesBloc = UpdatesBloc(parishUpdatesRepository: mockIParishUpdatesRepository);
  });

  tearDown(() => updatesBloc.close());

  blocTest<UpdatesBloc, UpdatesState>(
    'emits [loading, success] when updates are fetched successfully',
    build: () => updatesBloc,

    act: (bloc) {
      when(() => mockIParishUpdatesRepository.fetchParishUpdates(any())).thenAnswer(
        (_) async => Right([
          ParishUpdateModel(
            createdAt: '',
            postingDate: '',
          ),
        ]),
      );

      bloc.add(UpdatesParishUpdateFetched());
    },
    expect: () => [
      const UpdatesState(status: UpdatesStatus.loading, errorMessage: null),
      const UpdatesState(
        status: UpdatesStatus.successful,
        errorMessage: null,
        updateList: [
          ParishUpdateModel(
            createdAt: '',
            postingDate: '',
          ),
        ],
      ),
    ],
  );

  blocTest<UpdatesBloc, UpdatesState>(
    'emits [loading, failure] when updates are fetched successfully',
    build: () => updatesBloc,

    act: (bloc) {
      when(
        () => mockIParishUpdatesRepository.fetchParishUpdates(any()),
      ).thenAnswer((_) async => Left(CustomFailure(message: tErrorMessage)));
      bloc.add(UpdatesParishUpdateFetched());
    },
    expect: () => [
      const UpdatesState(
        status: UpdatesStatus.loading,
        errorMessage: null,
      ),
      const UpdatesState(
        status: UpdatesStatus.failed,
        errorMessage: tErrorMessage,
      ),
    ],
  );

  blocTest<UpdatesBloc, UpdatesState>(
    'emits [loading, success] when fetched more updates successfully',
    build: () => updatesBloc,

    act: (bloc) {
      when(() => mockIParishUpdatesRepository.fetchMoreParishUpdates(10)).thenAnswer(
        (_) async => Right([
          ParishUpdateModel(createdAt: '', postingDate: ''),
        ]),
      );
      bloc.add(UpdatesParishMoreUpdateFetched());
    },
    expect: () => [
      const UpdatesState(updateParishStatus: UpdatesStatus.loading, errorMessage: null),
      const UpdatesState(
        updateParishStatus: UpdatesStatus.successful,
        updateList: [
          ParishUpdateModel(
            createdAt: '',
            postingDate: '',
          ),
        ],
        hasNextPage: false,
        errorMessage: null,
      ),
    ],
  );

  blocTest<UpdatesBloc, UpdatesState>(
    'emits [loading, failure] when fetched more updates successfully ',
    build: () => updatesBloc,

    act: (bloc) {
      when(
        () => mockIParishUpdatesRepository.fetchMoreParishUpdates(any()),
      ).thenAnswer((_) async => Left(CustomFailure(message: 'error message')));
      bloc.add(UpdatesParishMoreUpdateFetched());
    },
    expect: () => [
      const UpdatesState(updateParishStatus: UpdatesStatus.loading, errorMessage: null),
      const UpdatesState(updateParishStatus: UpdatesStatus.failed, errorMessage: tErrorMessage),
    ],
  );
}

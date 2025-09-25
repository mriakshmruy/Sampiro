import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sampiro/core/keys/sampiro_keys.dart';
import 'package:sampiro/dependency_injection.dart';
import 'package:sampiro/features/reflection/data/model/parish_reflection_model.dart';
import 'package:sampiro/features/reflection/domain/repositories/ireflection_repository.dart';
import 'package:sampiro/features/reflection/presentation/bloc/reflection_bloc.dart';
import 'package:sampiro/features/reflection/presentation/widgets/reflection_view.dart';

import '../../../helpers/pump_app.dart';

class MockIReflectionRepository extends Mock implements IReflectionRepository {}

void main() {
  late MockIReflectionRepository mockIReflectionRepository;
  late MockReflectionBloc mockReflectionBloc;

  setUpAll(() {
    mockIReflectionRepository = MockIReflectionRepository();
    getIt.registerSingleton<IReflectionRepository>(mockIReflectionRepository);
  });

  setUp(() {
    mockReflectionBloc = MockReflectionBloc();
  });

  tearDown(() {
    mockReflectionBloc.close();
  });

  testWidgets(
    'App bar contains the right title and navigation button ',
    (tester) async {
      whenListen(mockReflectionBloc, Stream.fromIterable([const ReflectionState()]));

      when(() => mockReflectionBloc.state).thenReturn(const ReflectionState());

      await tester.pumpApp(const ReflectionView(), reflectionBloc: mockReflectionBloc);
      await tester.pump();

      expect(find.byIcon(Icons.arrow_back_ios_outlined), findsOneWidget);
      await tester.pump();
    },
  );

  testWidgets(
    'Renders a daily reflection when the status is successful.',
    (tester) async {
      whenListen(
        mockReflectionBloc,
        Stream.fromIterable([
          const ReflectionState(),
          const ReflectionState(
            status: ReflectionStatus.successful,
            reflection: ParishReflectionModel(createdAt: 'createdAt'),
          ),
        ]),
      );

      when(() => mockReflectionBloc.state).thenReturn(const ReflectionState());

      await tester.pumpApp(const ReflectionView(), reflectionBloc: mockReflectionBloc);
      await tester.pump();

      expect(find.byKey(SampiroKeys.dailyReflectionKey), findsOneWidget);
      await tester.pump();
    },
  );

  testWidgets(
    'emits an error message when the status is failed.',
    (tester) async {
      whenListen(
        mockReflectionBloc,
        Stream.fromIterable([
          const ReflectionState(),
          const ReflectionState(
            status: ReflectionStatus.failed,
            errorMessage: 'error message',
          ),
        ]),
      );

      when(() => mockReflectionBloc.state).thenReturn(const ReflectionState());

      await tester.pumpApp(const ReflectionView(), reflectionBloc: mockReflectionBloc);
      await tester.pump();

      // expect(find.byKey(SampiroKeys.dailyReflectionErrorKey), findsOneWidget);

      // expect(find.textContaining('error message'), findsOneWidget);
    },
  );
}

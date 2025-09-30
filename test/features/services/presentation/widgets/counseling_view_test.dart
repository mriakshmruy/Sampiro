import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sampiro/dependency_injection.dart';
import 'package:sampiro/features/services/domain/repositories/iservices_repository.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
import 'package:sampiro/features/services/presentation/widgets/counseling_view.dart';

import '../../../helpers/pump_app.dart';

class MockIServicesRepository extends Mock implements IServicesRepository {}

void main() {
  late MockIServicesRepository mockIServicesRepository;
  late MockServicesBloc mockServicesBloc;

  setUpAll(() {
    mockIServicesRepository = MockIServicesRepository();
    getIt.registerSingleton<IServicesRepository>(mockIServicesRepository);
  });

  setUp(() {
    mockServicesBloc = MockServicesBloc();
  });
  tearDown(() {
    mockServicesBloc.close();
  });
  testWidgets('renders Counseling view', (tester) async {
    // Arrange
    when(() => mockServicesBloc.state).thenReturn(
      const ServicesState(), // make sure you have a const constructor
    );
    await tester.pumpApp(const CounselingView(), servicesBloc: mockServicesBloc);

    // TODO: Implement test
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sampiro/core/keys/sampiro_keys.dart';
import 'package:sampiro/core/widgets/sampiro_time_picker.dart';
import 'package:sampiro/dependency_injection.dart';
import 'package:sampiro/features/services/domain/repositories/iservices_repository.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
import 'package:sampiro/features/services/presentation/widgets/counseling_view.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/set_display_size.dart';

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
    when(() => mockServicesBloc.state).thenReturn(
      const ServicesState(), // make sure you have a const constructor
    );
  });
  tearDown(() {
    mockServicesBloc.close();
  });
  testWidgets('renders RequestDialog when transaction is successful', (tester) async {
    // Arrange

    whenListen(
      mockServicesBloc,
      Stream.fromIterable([
        const ServicesState(),
        const ServicesState(status: ServicesStatus.successful, docRefId: 'id'),
      ]),
    );

    // Act
    await tester.pumpApp(const CounselingView(), servicesBloc: mockServicesBloc);
    await tester.pump();

    expect(find.byKey(SampiroKeys.requestDialogKey), findsOneWidget);
    await tester.pump();
    // expect(find.byType(RequestDialog), findsOneWidget);
    expect(find.byKey(SampiroKeys.dialogKey), findsOneWidget);
  });

  testWidgets('emits name when name textfield is inputted', (tester) async {
    // Act

    await tester.pumpApp(const CounselingView(), servicesBloc: mockServicesBloc);
    await tester.pump();

    await tester.enterText(find.byKey(SampiroKeys.counselingNameKey), 'z');
    await tester.pump();

    // expect(mockServicesBloc.state.fieldName, equals('z'));

    verify(() => mockServicesBloc.add(const ServicesFieldNameChanged('z'))).called(1);
  });

  testWidgets('calls ServicesMobileNoChanged event when mobile no is inputted', (tester) async {
    // Act

    await tester.pumpApp(const CounselingView(), servicesBloc: mockServicesBloc);
    await tester.pump();

    await tester.enterText(find.byKey(SampiroKeys.counselingMobileNoKey), '12-345-6789');
    await tester.pump();

    verify(() => mockServicesBloc.add(const ServicesMobileNoChanged('12-345-6789'))).called(1);
  });

  testWidgets('calls ServicesAddressChanged event when address is inputted', (tester) async {
    // Act

    await tester.pumpApp(const CounselingView(), servicesBloc: mockServicesBloc);
    await tester.pump();

    await tester.enterText(find.byKey(SampiroKeys.counselingAddressKey), 'address');
    await tester.pump();

    verify(() => mockServicesBloc.add(const ServicesAddressChanged('address'))).called(1);
  });

  testWidgets('calls ServicesTypeOfCounselingChanged event when item in dropdown is selected.', (tester) async {
    // Act

    await tester.pumpApp(const CounselingView(), servicesBloc: mockServicesBloc);
    await tester.pump();

    await tester.tap(
      find.byKey(SampiroKeys.typeOfCounselingKey),
    );
    await tester.pump();

    await tester.tap(find.text('Addiction'));
    await tester.pump();

    verify(() => mockServicesBloc.add(const ServicesTypeOfCounselingChanged('Addiction'))).called(1);
  });

  testWidgets('calls ServicesPreferredCounselingDateChanged event when date is inputted', (tester) async {
    // Act

    await tester.pumpApp(const CounselingView(), servicesBloc: mockServicesBloc);
    await tester.pump();

    await tester.enterText(find.byKey(SampiroKeys.preferredCounselingDateKey), '00/00/0000');
    await tester.pump();

    verify(() => mockServicesBloc.add(const ServicesPreferredCounselingDateChanged('00/00/0000'))).called(1);
  });

  testWidgets('calls ServicesPreferredCounselingTimeChanged event when time is selected.', (tester) async {
    tester.setDesktopDisplaySize();
    // Act
    await tester.pumpApp(const CounselingView(), servicesBloc: mockServicesBloc);
    await tester.pump();

    await tester.tap(find.byType(SampiroTimePicker));
    await tester.pump();

    await tester.tap(find.textContaining('OK', findRichText: true));
    await tester.pump();

    // verify(
    //   () => mockServicesBloc.add( ServicesPreferredCounselingTimeChanged(TimeOfDay(hour: int.fromEnvironment()))),
    // ).called(1);
  });
}

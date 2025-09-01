import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sampiro/app/bloc/app_bloc.dart';

class MockPackageInfo extends Mock implements PackageInfo {}

void main() {
  late AppBloc appBloc;
  late MockPackageInfo mockPackageInfo;

  setUp(() {
    mockPackageInfo = MockPackageInfo();
    appBloc = AppBloc(packageInfo: mockPackageInfo);
  });

  tearDown(() => appBloc.close());

  blocTest<AppBloc, AppState>(
    'emits version number and build number when AppVersionFetched is called',
    build: () => appBloc,
    act: (bloc) {
      // Arrange = Stubbing
      when(() => mockPackageInfo.version).thenReturn('5.0.0');
      when(() => mockPackageInfo.buildNumber).thenReturn('99');
      // Act = Actual triggering
      bloc.add(const AppVersionFetched());

      // Assert

      // verify(() => mockPackageInfo.version).called(1);
    },
    expect: () => const <AppState>[AppState(version: '5.0.0', buildNumber: '99')],
  );
}

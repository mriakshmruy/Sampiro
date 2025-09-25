import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sampiro/features/reflection/presentation/bloc/reflection_bloc.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
import 'package:sampiro/l10n/gen/app_localizations.dart';

class MockServicesBloc extends MockBloc<ServicesEvent, ServicesState> implements ServicesBloc {}

class MockReflectionBloc extends MockBloc<ReflectionEvent, ReflectionState> implements ReflectionBloc {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    ServicesBloc? servicesBloc,
    ReflectionBloc? reflectionBloc,
  }) async {
    return mockNetworkImages(() async {
      return pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: servicesBloc ?? MockServicesBloc(),
            ),
            BlocProvider.value(
              value: reflectionBloc ?? MockReflectionBloc(),
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('en'),
            home: widget,
          ),
        ),
      );
    });
  }
}

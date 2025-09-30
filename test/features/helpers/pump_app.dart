import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sampiro/features/services/presentation/bloc/services_bloc.dart';
import 'package:sampiro/l10n/gen/app_localizations.dart';

class MockServicesBloc extends MockBloc<ServicesEvent, ServicesState> implements ServicesBloc {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    NavigatorObserver? navigatorObserver,
    ServicesBloc? servicesBloc,
  }) async {
    return mockNetworkImages(() async {
      return pumpWidget(
        BlocProvider.value(
          value: servicesBloc ?? MockServicesBloc(),
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

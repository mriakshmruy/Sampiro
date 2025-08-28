import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required PackageInfo packageInfo}) : _packageInfo = packageInfo, super(const AppState()) {
    on<AppVersionFetched>(_onAppVersionFetched);
    // Trigger Events
    add(const AppVersionFetched());
  }

  final PackageInfo _packageInfo;

  void _onAppVersionFetched(
    AppVersionFetched event,
    Emitter<AppState> emit,
  ) {
    final version = _packageInfo.version;

    emit(
      state.copyWith(
        version: version,
        buildNumber: _packageInfo.buildNumber,
      ),
    );
  }
}

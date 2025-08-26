part of 'services_bloc.dart';

@freezed
abstract class ServicesEvent with _$ServicesEvent {
  const factory ServicesEvent.started({required ServicesStatus status}) = ServicesStarted;
}

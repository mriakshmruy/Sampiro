part of 'services_bloc.dart';

enum ServicesStatus { none, loading, successful, failed }

@freezed
abstract class ServicesState with _$ServicesState { 
  const factory ServicesState({
    @Default(ServicesStatus.none) ServicesStatus status,
  }) = _ServicesState;
  const ServicesState._();
}

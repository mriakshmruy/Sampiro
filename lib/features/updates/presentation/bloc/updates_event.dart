part of 'updates_bloc.dart';

@freezed
abstract class UpdatesEvent with _$UpdatesEvent {
  const factory UpdatesEvent.parishUpdateFetched() = UpdatesParishUpdateFetched;
}

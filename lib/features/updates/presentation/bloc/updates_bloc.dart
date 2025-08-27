import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'updates_event.dart';
part 'updates_state.dart';
part 'updates_bloc.freezed.dart';

class UpdatesBloc extends Bloc<UpdatesEvent, UpdatesState> {
  UpdatesBloc() : super(const UpdatesState()) {
    on<UpdatesStarted>(_onUpdatesStarted);
  }

  void _onUpdatesStarted(
    UpdatesStarted event,
    Emitter<UpdatesState> emit,
  ) {
    // TODO: implement event handler
  }
}

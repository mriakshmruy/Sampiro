import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'more_event.dart';
part 'more_state.dart';
part 'more_bloc.freezed.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc() : super(const MoreState()) {
    on<MoreStarted>(_onMoreStarted);
  }

  void _onMoreStarted(
    MoreStarted event,
    Emitter<MoreState> emit,
  ) {
    // TODO: implement event handler
  }
}

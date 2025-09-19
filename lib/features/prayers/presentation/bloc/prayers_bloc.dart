import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prayers_bloc.freezed.dart';
part 'prayers_event.dart';
part 'prayers_state.dart';

class PrayersBloc extends Bloc<PrayersEvent, PrayersState> {
  PrayersBloc() : super(const PrayersState()) {
    on<PrayersStarted>(_onPrayersStarted);
  }

  void _onPrayersStarted(
    PrayersStarted event,
    Emitter<PrayersState> emit,
  ) {}
}

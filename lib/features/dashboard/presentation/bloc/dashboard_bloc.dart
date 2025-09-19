import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<DashboardStarted>(_onDashboardStarted);
  }

  void _onDashboardStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) {}
}

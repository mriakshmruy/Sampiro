import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_bloc.freezed.dart';
part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(const ServicesState()) {
    on<ServicesStarted>(_onServicesStarted);
  }

  void _onServicesStarted(
    ServicesStarted event,
    Emitter<ServicesState> emit,
  ) {}
}

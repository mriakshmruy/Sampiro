import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_event.dart';
part 'menu_state.dart';
part 'menu_bloc.freezed.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(const MenuState()) {
    on<MenuStarted>(_onMenuStarted);
  }

  void _onMenuStarted(
    MenuStarted event,
    Emitter<MenuState> emit,
  ) {
    // TODO: implement event handler
  }
}

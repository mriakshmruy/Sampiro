import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sampiro/features/updates/presentation/bloc/updates_bloc.dart';

class MockUpdatesBloc extends MockBloc<UpdatesEvent, UpdatesState> implements UpdatesBloc {}

void main() {
  late MockUpdatesBloc mockUpdatesBloc;

  setUp(() {
    mockUpdatesBloc = MockUpdatesBloc();
  });

  testWidgets('renders states from whenListen', callback);
}

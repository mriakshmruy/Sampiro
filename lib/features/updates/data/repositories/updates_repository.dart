import 'package:sampiro/features/updates/domain/repositories/iupdates_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUpdatesRepository)
class UpdatesRepository implements IUpdatesRepository {}

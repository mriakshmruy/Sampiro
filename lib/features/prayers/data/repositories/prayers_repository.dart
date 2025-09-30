import 'package:injectable/injectable.dart';
import 'package:sampiro/features/prayers/domain/repositories/iprayers_repository.dart';

@LazySingleton(as: IPrayersRepository)
class PrayersRepository implements IPrayersRepository {}

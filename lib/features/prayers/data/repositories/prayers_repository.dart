import 'package:sampiro/features/prayers/domain/repositories/iprayers_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPrayersRepository)
class PrayersRepository implements IPrayersRepository {}

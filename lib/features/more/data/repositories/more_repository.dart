import 'package:injectable/injectable.dart';
import 'package:sampiro/features/more/domain/repositories/imore_repository.dart';

@LazySingleton(as: IMoreRepository)
class MoreRepository implements IMoreRepository {}

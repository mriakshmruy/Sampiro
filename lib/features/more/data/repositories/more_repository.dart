import 'package:sampiro/features/more/domain/repositories/imore_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMoreRepository)
class MoreRepository implements IMoreRepository {}

import 'package:injectable/injectable.dart';
import 'package:sampiro/features/home/domain/repositories/ihome_repository.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepository implements IHomeRepository {}

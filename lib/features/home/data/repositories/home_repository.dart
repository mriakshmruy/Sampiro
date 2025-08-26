import 'package:sampiro/features/home/domain/repositories/ihome_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepository implements IHomeRepository {}

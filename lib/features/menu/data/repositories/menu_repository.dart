import 'package:sampiro/features/menu/domain/repositories/imenu_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMenuRepository)
class MenuRepository implements IMenuRepository {}

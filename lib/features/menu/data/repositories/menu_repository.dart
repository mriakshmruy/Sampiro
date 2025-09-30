import 'package:injectable/injectable.dart';
import 'package:sampiro/features/menu/domain/repositories/imenu_repository.dart';

@LazySingleton(as: IMenuRepository)
class MenuRepository implements IMenuRepository {}
